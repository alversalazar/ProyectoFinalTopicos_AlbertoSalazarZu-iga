using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmViatic : Form
    {

        /* variables */

        static string MANEJADOR = frmHome1.manejadorr;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int idSujeto = 0;

        static int id;
        static string place;
        static string description;
        static decimal amount;
        static int idEmployee;
        static Int16 status;
        public frmViatic()
        {
            InitializeComponent();
        }

        private void frmViatic_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Viatic '" + frmHome1.manejadorr + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }

        private void InsertarRegistros()
        {
            if (CamposVacios())
            {
                MessageBox.Show("Por favor, complete todos los campos.", "Datos faltantes", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return; // Sale de la función si hay campos vacíos
            }
            if (frmHome1.manejadorr == "SQL SERVER")
            {
                frmHome1.contarid("SELECT COUNT(*) FROM Viatic");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Viatic '" + frmHome1.manejadorr + "','" + place + "','" + description + "','" + amount + "','" + idEmployee  + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtPlace.Text = "";
            txtDescrop.Text = "";
            txtAmount.Text = "";
            txtIdEmployee.Text = "";

        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtPlace.Text) ||
                   string.IsNullOrWhiteSpace(txtDescrop.Text) ||
                   string.IsNullOrWhiteSpace(txtAmount.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtIdEmployee.Text) 
                 ;
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            place = txtPlace.Text;
            description = txtDescrop.Text;
            amount = decimal.Parse(txtAmount.Text);
            idEmployee = int.Parse(txtIdEmployee.Text);
            
            InsertarRegistros();
        }

        private void ActualizarRegistros()
        {


            consulta = "EXEC UPDATE_Viatic '" +
                 frmHome1.manejadorr + "'," + id + ",'" + place + "','" + description + "','" + amount + "','" + idEmployee + "'," + status + "";


            frmHome1.EjecutarComando(consulta);

            datagridCareer.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
        }
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            datagridCareer.Enabled = true;
            btnDelete.Enabled = true;
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = datagridCareer.Rows[datagridCareer.CurrentRow.Index];
            int parsedId;
            if (int.TryParse(row.Cells[1].Value?.ToString(), out parsedId))
            {
                id = parsedId;
                place = row.Cells[2].Value?.ToString();
                description = row.Cells[3].Value?.ToString();
             


            }
            else
            {
                // Manejar el caso donde la conversión del estado falla
            }
            ActualizarRegistros();
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_Viatic '" + frmHome1.manejadorr + "','" + id + "'";

            frmHome1.EjecutarComando(consulta);
            btnUpdate.Enabled = true;
            MostrarRegistros();
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (datagridCareer.SelectedRows.Count > 0)
            {
                DataGridViewRow row = datagridCareer.SelectedRows[0]; // Obtiene la primera fila seleccionada
                int idToDelete;

                if (int.TryParse(row.Cells[0].Value?.ToString(), out idToDelete))
                {
                    Eliminar(idToDelete); //  eliminación en la base de datos
                    MostrarRegistros(); // Actualiza el DataGridView
                }
                else
                {
                    MessageBox.Show("No se puede obtener el ID para eliminar la fila.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Seleccione una fila para eliminar.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
