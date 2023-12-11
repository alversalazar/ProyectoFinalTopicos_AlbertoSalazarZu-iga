using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmCareer1 : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;


        static int id;
        static string name;
        static string duration;
        static string description;
        static Int16 status;

        private DataGridView miDataGridView;

        static int idSujeto = 0;
        public frmCareer1()
        {
            InitializeComponent();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Career '" + frmHome1.manejadorr + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }
        private void frmCareer1_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
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
                frmHome1.contarid("SELECT COUNT(*) FROM Career");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Career  '" + frmHome1.manejadorr + "','" + name + "','" + duration + "','" + description + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtDuration.Text = "";
            txtDescription.Text = "";
        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtName.Text) ||
                   string.IsNullOrWhiteSpace(txtDuration.Text) ||
                   string.IsNullOrWhiteSpace(txtDescription.Text);
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
            duration = txtDuration.Text;
            description = txtDescription.Text;

            InsertarRegistros();
        }
        private void ActualizarRegistros()
        {


            consulta = "EXEC UPDATE_Career '" +
                 frmHome1.manejadorr + "'," + id + ",'" + name + "','" + duration + "','" + description +  "'," + status + "";


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
                name = row.Cells[2].Value?.ToString();
                duration = row.Cells[3].Value?.ToString();
                description = row.Cells[4].Value?.ToString();
            



            }
            else
            {
            }
            ActualizarRegistros();
        }


        private void Eliminar(int id)
        {
           


            consulta = "EXEC DELETE_Career  '" + frmHome1.manejadorr + "','" + id  + "'";

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
