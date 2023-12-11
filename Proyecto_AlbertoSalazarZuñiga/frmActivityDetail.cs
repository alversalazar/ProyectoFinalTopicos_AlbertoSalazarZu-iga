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
    public partial class frmActivityDetail : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr1;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int idSujeto;
        static int id;
        static string description;
        static int idEvaluationDetail;
        static int idComplementaryActivity;

        static Int16 status;
        public frmActivityDetail()
        {
            InitializeComponent();
        }

        private void frmActivityDetail_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_ActivityDetail '" + frmHome1.manejadorr1 + "'," + idUser;
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
                frmHome1.contarid("SELECT COUNT(*) FROM [MYSQL]...ActivityDetail");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_ActivityDetail '" + frmHome1.manejadorr1 + "','" + description + "','" + idEvaluationDetail+ "','" + idComplementaryActivity + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtDescription.Text = "";
            txtIdEvalDeta.Text = "";

            txtIdComplAct.Text = "";


        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtDescription.Text) ||
                   string.IsNullOrWhiteSpace(txtIdEvalDeta.Text) ||
                   string.IsNullOrWhiteSpace(txtIdComplAct.Text)
                 ;
        }
        private void ActualizarRegistros()
        {


            consulta = "EXEC UPDATE_ActivityDetail '" +
                 frmHome1.manejadorr2 + "'," + id + ",'" + description + "','" + idEvaluationDetail + "','" + idComplementaryActivity + "'," + status + "";


            frmHome1.EjecutarComando(consulta);

            datagridCareer.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
        }
        private void btnInsertar_Click(object sender, EventArgs e)
        {
            description = txtDescription.Text;
            idEvaluationDetail = int.Parse(txtIdEvalDeta.Text);
            idComplementaryActivity = int.Parse(txtIdComplAct.Text);
            InsertarRegistros();
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_ActivityDetail  '" + frmHome1.manejadorr1 + "','" + id + "'";

            frmHome1.EjecutarComando(consulta);
    
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

        private void btnSave_Click(object sender, EventArgs e)
        {

            DataGridViewRow row = datagridCareer.Rows[datagridCareer.CurrentRow.Index];
            int parsedId;
            if (int.TryParse(row.Cells[1].Value?.ToString(), out parsedId))
            {
                id = parsedId;
                description = row.Cells[2].Value?.ToString();
          



            }
            else
            {
                // Manejar el caso donde la conversión del estado falla
            }
            ActualizarRegistros();
        }
    }
}
