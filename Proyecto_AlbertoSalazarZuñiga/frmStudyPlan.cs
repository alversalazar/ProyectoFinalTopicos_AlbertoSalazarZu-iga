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
using System.Xml.Linq;
using static System.Collections.Specialized.BitVector32;

namespace Proyecto_AlbertoSalazarZuñiga
{
   

    public partial class frmStudyPlan : Form
    {
    /* variables */

    static string MANEJADOR = frmHome1.manejadorr;

    string consulta = "";
    DataSet ds = new DataSet();
    static int idUser;


        static int id;
        static string objetive;
        static string stardate;
        static string finaldate;

        static string key;
      
        static Int16 status;

        static int idSujeto = 0;
        public frmStudyPlan()
        {
            InitializeComponent();
        }

        private void frmStudyPlan_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_StudyPlan '" + frmHome1.manejadorr + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }

        private void dtbDateof_ValueChanged(object sender, EventArgs e)
        {

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
                frmHome1.contarid("SELECT COUNT(*) FROM StudyPlan");
                idSujeto = frmHome1.count;
            }
            consulta = "EXEC INSERT_StudyPlan'" + frmHome1.manejadorr + "','" + objetive + "','" + stardate + "','" + finaldate + "','" + key + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtObjetive.Text = "";
            txtKey.Text = "";
       

        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtObjetive.Text) ||
                   string.IsNullOrWhiteSpace(txtKey.Text);
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            objetive = txtObjetive.Text;
            stardate = dtbStarDate.Text;
            finaldate = dtbFinalDate.Text;
            key = txtKey.Text;
        
       
            InsertarRegistros();
        }
 private void ActualizarRegistros()
        {


           consulta = "EXEC UPDATE_StudyPlan '" + 
                frmHome1.manejadorr + "'," + id + ",'" + objetive + "','" + stardate + "','" + finaldate + "','" + key + "'," + status + "";
                        
            
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
                objetive = row.Cells[2].Value?.ToString();
                stardate = row.Cells[3].Value?.ToString();
                finaldate = row.Cells[4].Value?.ToString();
                key = row.Cells[5].Value?.ToString();

                    
                }
                else
                {
                    // Manejar el caso donde la conversión del estado falla
                }
          ActualizarRegistros();
        }

       

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            datagridCareer.Enabled = true;
            btnDelete.Enabled = true;
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
        }
        private void Eliminar(int id)
        {



            consulta = "EXEC DELETE_StudyPlan '" + frmHome1.manejadorr + "','" + id + "'";

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
