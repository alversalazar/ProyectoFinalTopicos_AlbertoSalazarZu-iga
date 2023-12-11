using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmCompanyStudent : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr1;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int idSujeto;
        static int id;
        static string date;
        static string workplace;
        static int idStudent;

        static Int16 status;
        public frmCompanyStudent()
        {
            InitializeComponent();
        }

        private void frmCompanyStudent_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_CompanyStudent '" + frmHome1.manejadorr1 + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }
        private void InsertarRegistros()
        {
            if (CamposVacios())
            {
                MessageBox.Show("Por favor, complete todos los campos.", "Datos faltantes", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return; // Sale de la función si hay campos vacíos
            }
            if (frmHome1.manejadorr1 == "MYSQL")
            {
                frmHome1.contarid("SELECT COUNT(*) FROM [MYSQL]...CompanyStudent");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_CompanyStudent '" + frmHome1.manejadorr1 + "','" + date + "','" + workplace + "','" + idStudent + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
           
            txtWorkPlace.Text = "";

            txtIdStudent.Text = "";


        }
        private bool CamposVacios()
        {
            return 
                   string.IsNullOrWhiteSpace(txtWorkPlace.Text) ||
                   string.IsNullOrWhiteSpace(txtIdStudent.Text)
                 ;
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            date = dtbDate.Text;
            workplace = txtWorkPlace.Text;
            idStudent = int.Parse(txtIdStudent.Text);
            InsertarRegistros();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            datagridCareer.Enabled = true;
       
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_CompanyStudent  '" + frmHome1.manejadorr1 + "','" + id + "'";

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
