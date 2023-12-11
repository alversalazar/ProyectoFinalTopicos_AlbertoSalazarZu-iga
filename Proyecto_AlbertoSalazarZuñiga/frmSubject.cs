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
    public partial class frmSubject : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int idSujeto = 0;

        static int id;
        static string name;
        static string credit;
        static string unit;
        static string characteristic;
        static string keyMetter;
        static Int16 status;


        public frmSubject()
        {
            InitializeComponent();
        }

        private void txtIdSubject_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmSubject_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Subject '" + frmHome1.manejadorr + "'," + idUser;
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
                frmHome1.contarid("SELECT COUNT(*) FROM Subject");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Subject '" + frmHome1.manejadorr + "','" + name + "','" + credit + "','" + unit + "','" + characteristic + "','" + keyMetter  + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtCredit.Text = "";
            txtUnit.Text = "";
            txtCharacteristic.Text = "";
            txtKeyMatter.Text = "";
       
        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtName.Text) ||
                   string.IsNullOrWhiteSpace(txtCredit.Text) ||
                   string.IsNullOrWhiteSpace(txtUnit.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtCharacteristic.Text) ||
                   string.IsNullOrWhiteSpace(txtKeyMatter.Text)
                 ;
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
             credit = txtCredit.Text;
            unit = txtUnit.Text;
            characteristic = txtCharacteristic.Text;
            keyMetter = txtKeyMatter.Text;
            InsertarRegistros();
        }
        private void ActualizarRegistros()
        {
            switch (frmHome1.manejadorr)
            {
                case "SQL SERVER":
                    consulta = "EXEC UPDATE_Subject '" + frmHome1.manejadorr + "'," + id + ",'" + name + "','" + credit + "','" + unit + "','" + characteristic + "','" + keyMetter + "'," + status + "";
                    frmHome1.EjecutarComando(consulta);

                    datagridCareer.Enabled = false;
                    btnSave.Enabled = false;
                    btnUpdate.Enabled = true;
                    break;
                default:
                    MessageBox.Show("Manejador de base de datos no válido.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
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

                name = row.Cells[2].Value.ToString();
                credit = row.Cells[3].Value.ToString();
                unit = row.Cells[4].Value.ToString();

                characteristic = row.Cells[5].Value.ToString();
                keyMetter = row.Cells[6].Value.ToString(); 
                status = Convert.ToInt16(row.Cells[7].Value);
                
                
            }
            ActualizarRegistros();
           
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_Subject '" + frmHome1.manejadorr + "','" + id + "'";

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
