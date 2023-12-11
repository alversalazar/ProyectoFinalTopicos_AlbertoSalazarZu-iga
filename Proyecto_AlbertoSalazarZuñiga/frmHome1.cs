using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmHome1 : Form
    {
        /* Variables */
        public static string tipoUsuario;
        public static string manejadorr = "SQL SERVER";
        public static string manejadorr1 = "MYSQL";
        public static string manejadorr2 = "POSTGRESQL";
        static string user;

        public string Usuario { get; set; }

        public static int count = 0;

        static int registroAfectados = 0;

        /*Connection strings*/
        private static string cadenaConexion = "Server=localhost\\SQLEXPRESS;Database = Vinculation; Trusted_Connection = True;";

        private static SqlConnection conexion = new SqlConnection(cadenaConexion);

        public static void AgregarDataTable(DataSet ds, string consulta, string nombreTabla, DataGridView DataGridView1a)
        {
            SqlDataAdapter da = new SqlDataAdapter(consulta, cadenaConexion);
            ds = new DataSet();
            da.Fill(ds, nombreTabla);
            DataGridView1a.DataSource = ds.Tables["Vinculation"];
            DataGridView1a.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
        /* Variables */
       
        public frmHome1()
        {
            InitializeComponent();
            this.BackColor = Color.Aqua;


        }

       
       
        private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

      


        private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        private void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Cierra el formulario actual (frmHome)
            this.Close();

            // Abre el formulario de inicio de sesión (frmLogin)
            frmLogin loginForm = new frmLogin();
            loginForm.Show();
        }

        private void careerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
              
        }


        public static void contarid(string consulta)
        {
            conexion.Open();
            SqlCommand cont = new SqlCommand(consulta, conexion);
            count = (int)cont.ExecuteScalar();
            count++;
            conexion.Close();
        }
        private void frmHome1_Load(object sender, EventArgs e)
        {
            this.BackColor = Color.Aqua;
            if (!string.IsNullOrEmpty(Usuario))
            {
                // Mostrar el nombre de usuario en la etiqueta
                lblUser.Text = "Hola, " + $"{Usuario}"+ " 🤵 ";
            }
        }

        private void careerToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            try
            {
                frmCareer1 frmClientes = new frmCareer1();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmCareer1)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public static int EjecutarComando(string consulta)
            {

                try
                {
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    conexion.Open();
                    registroAfectados = comando.ExecuteNonQuery();

                    if (registroAfectados != 0)
                    {
                        MessageBox.Show("Los cambios se realizaron correctamente, por favor actualize la tabla");
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Hubo un error al intentar realizar la operación, verifique que sus datos sean correctos\n" + ex.Message);
                }

                conexion.Close();
                return registroAfectados;

            }

        private void employeeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmEmployee frmClientes = new frmEmployee();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmEmployee)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void studyPlanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmStudyPlan frmClientes = new frmStudyPlan();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmStudyPlan)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void subjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmSubject frmClientes = new frmSubject();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmSubject)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void viaticToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmViatic frmClientes = new frmViatic();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmViatic)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void activityDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmActivityDetail frmClientes = new frmActivityDetail();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmActivityDetail)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void companyStudentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmCompanyStudent frmClientes = new frmCompanyStudent();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmCompanyStudent)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void complementaryActivityToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmComplementaryActivity frmClientes = new frmComplementaryActivity();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmComplementaryActivity)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void evaluationDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmEvaluationDetail frmClientes = new frmEvaluationDetail();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmEvaluationDetail)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void studentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmStudent frmClientes = new frmStudent();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmStudent)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void agreementToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmAgreement frmClientes = new frmAgreement();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmAgreement)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void companyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmCompany frmClientes = new frmCompany();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmCompany)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void objectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmObjective frmClientes = new frmObjective();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmObjective)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void purpuseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmPurpose frmClientes = new frmPurpose();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmPurpose)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void territoryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmTerritory frmClientes = new frmTerritory();
                frmClientes.MdiParent = this;
                foreach (Form frm in Application.OpenForms)
                {
                    if (frm is frmTerritory)
                    {
                        frm.Show();
                        frm.Size = MinimumSize;
                        frm.WindowState = FormWindowState.Normal;
                        return;
                    }
                }
                frmClientes.Show();
                frmClientes.Size = this.ClientSize; // Ajustar al tamaño del formulario MDI

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Aviso",
                                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void sQLSERVERToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void cerrarSesionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Cierra el formulario actual (frmHome)
            this.Close();

            // Abre el formulario de inicio de sesión (frmLogin)
            frmLogin loginForm = new frmLogin();
            loginForm.Show();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {

        }
    }
    }

