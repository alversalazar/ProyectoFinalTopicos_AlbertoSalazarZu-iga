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
    public partial class frmEmployee : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int id;
        static string name;
        static string lastname;
        static string mothersLastName;

        static string gender;
        static string phone;
        static string email;

        static string address;
        static string socialSecurity;
        static string dateOfHire;

        static int idSubject;
        static Int16 status;

        static int idSujeto = 0;
        public frmEmployee()
        {
            InitializeComponent();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Employee '" + frmHome1.manejadorr + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }
        private void frmEmployee_Load(object sender, EventArgs e)
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
                frmHome1.contarid("SELECT COUNT(*) FROM Employee");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Employee  '" + frmHome1.manejadorr + "','" + name + "','" + lastname + "','" + mothersLastName + "','" + gender + "','" + phone + "','" + email +
                "','" + address + "','" + socialSecurity + "','" + dateOfHire +  "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtLastName.Text = "";
            txtMotherLN.Text = "";
            txtGender.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtSocialSecurity.Text = "";
        
        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtName.Text) ||
                   string.IsNullOrWhiteSpace(txtLastName.Text) ||
                   string.IsNullOrWhiteSpace(txtMotherLN.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtGender.Text) ||
                   string.IsNullOrWhiteSpace(txtPhone.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtEmail.Text) ||
                   string.IsNullOrWhiteSpace(txtAddress.Text)
                   ||
                   string.IsNullOrWhiteSpace(txtSocialSecurity.Text) ;
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
            lastname = txtLastName.Text;
            mothersLastName = txtMotherLN.Text;
            gender = txtGender.Text;
            phone = txtPhone.Text;
            email = txtEmail.Text;
            address = txtAddress.Text;
            socialSecurity = txtSocialSecurity.Text;
             dateOfHire = dtbDateof.Text;


            InsertarRegistros();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }
        private void ActualizarRegistros()
        {


            consulta = "EXEC UPDATE_Employee '" +
                 frmHome1.manejadorr + "'," + id + ",'" + name + "','" +
                 lastname + "','" + mothersLastName + "','" + gender  +"','" + phone
                 + "','" + email+ "','" + address+ "','" + socialSecurity+ "','" + dateOfHire + "'," + status + "";


            frmHome1.EjecutarComando(consulta);

            datagridCareer.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = datagridCareer.Rows[datagridCareer.CurrentRow.Index];
            int parsedId;
            if (int.TryParse(row.Cells[1].Value?.ToString(), out parsedId))
            {
                id = parsedId;
                name = row.Cells[2].Value?.ToString();
                lastname = row.Cells[3].Value?.ToString();
                mothersLastName = row.Cells[4].Value?.ToString();
                gender = row.Cells[5].Value?.ToString();
                phone = row.Cells[6].Value?.ToString();
                email = row.Cells[7].Value?.ToString();
                address = row.Cells[8].Value?.ToString();
                socialSecurity = row.Cells[9].Value?.ToString();
             




            }
            else
            {
                // Manejar el caso donde la conversión del estado falla
            }
            ActualizarRegistros();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            datagridCareer.Enabled = true;
            btnDelete.Enabled = true;
            btnSave.Enabled = true;
            button2.Enabled = false;
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_Employee  '" + frmHome1.manejadorr + "','" + id + "'";

            frmHome1.EjecutarComando(consulta);
            btnUpdate.Enabled = true;
            MostrarRegistros();
        }
        private void button1_Click(object sender, EventArgs e)
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
