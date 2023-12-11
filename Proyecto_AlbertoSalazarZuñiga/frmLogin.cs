using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmLogin : Form
    {
        private static string cadenaConexion = "Server=localhost\\SQLEXPRESS;Database = Vinculation; Trusted_Connection = True;";

        private static SqlConnection conexion = new SqlConnection(cadenaConexion);
        public frmLogin()
        {
            InitializeComponent();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            string usuario = txtUser.Text;
            string contraseña = txtPassword.Text;

            // Consulta para verificar el usuario y la contraseña en la base de datos
            string consulta = "SELECT COUNT(1) FROM [User] WHERE [name]=@usuario AND [password]=@contraseña";

            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.Parameters.AddWithValue("@usuario", usuario);
            comando.Parameters.AddWithValue("@contraseña", contraseña);

            conexion.Open();
            int count = Convert.ToInt32(comando.ExecuteScalar());
            conexion.Close();

            if (count == 1)
            {
                MessageBox.Show("¡Inicio exitoso!");
               
                // Aquí podrías abrir e
                frmHome1 frrm = new frmHome1();
                frrm.Usuario = usuario;
                frrm.Show(); // Cierra el formulario actual
                this.Hide();
                
            }
            else
            {
                MessageBox.Show("Nombre de usuario o contraseña incorrectos");
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            // Cierra la aplicación por completo
            Application.Exit();
        }
    }
}
