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
    public partial class frmStudent : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr1;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int id;
        static string name;
        static string lastname;
        static string mothersLastName;

        static string enrollmet;
        static string birthdate;
        static string curp;

        static string phone;
        static string rfc;
        static string socialSecurity;

        static Int16 status;

        static int idSujeto = 0;

        public frmStudent()
        {
            InitializeComponent();
        }

        private void frmStudent_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Student '" + frmHome1.manejadorr1 + "'," + idUser;
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
                frmHome1.contarid("SELECT COUNT(*) FROM [MYSQL]...Student");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Student  '" + frmHome1.manejadorr1 + "','" + name + "','" + lastname + "','" + mothersLastName + "','" + enrollmet + "','" + birthdate + "','" + curp +
               "','" + phone + "','" + rfc + "','" + socialSecurity + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtLastName.Text = "";
            txtMotherLN.Text = "";
            txtEnrollment.Text = "";
            txtPhone.Text = "";
            txtRFC.Text = "";
            txtSocialSecirity.Text = "";
         

        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtName.Text) ||
                   string.IsNullOrWhiteSpace(txtLastName.Text) ||
                   string.IsNullOrWhiteSpace(txtMotherLN.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtEnrollment.Text) ||
                   string.IsNullOrWhiteSpace(txtPhone.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtCurp.Text) ||
                   string.IsNullOrWhiteSpace(txtRFC.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtSocialSecirity.Text);
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
            lastname = txtLastName.Text;
            mothersLastName = txtMotherLN.Text;
            enrollmet = txtEnrollment.Text;
            phone = txtPhone.Text;
            rfc = txtRFC.Text;
            curp = txtCurp.Text;
            socialSecurity = txtSocialSecirity.Text;
            birthdate = dtbBirthDate.Text;


            InsertarRegistros();
        }
        private void Eliminar(int id)
        {

            consulta = "EXEC DELETE_Student  '" + frmHome1.manejadorr1 + "','" + id + "'";

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

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            datagridCareer.Enabled = true;

            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
        }
    }
}
