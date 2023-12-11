﻿using System;
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

namespace Proyecto_AlbertoSalazarZuñiga
{
    public partial class frmPurpose : Form
    {
        /* variables */

        static string MANEJADOR = frmHome1.manejadorr2;

        string consulta = "";
        DataSet ds = new DataSet();
        static int idUser;

        static int id;
        static string name;
        static string investigation;
      


        static Int16 status;

        static int idSujeto = 0;
        public frmPurpose()
        {
            InitializeComponent();
        }

        private void frmPurpose_Load(object sender, EventArgs e)
        {
            MostrarRegistros();
        }
        private void MostrarRegistros()
        {
            consulta = "EXEC SELECT_Purpose '" + frmHome1.manejadorr2 + "'," + idUser;
            frmHome1.AgregarDataTable(ds, consulta, "Vinculation", datagridCareer);
        }
        private void InsertarRegistros()
        {
            if (CamposVacios())
            {
                MessageBox.Show("Por favor, complete todos los campos.", "Datos faltantes", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return; // Sale de la función si hay campos vacíos
            }
            if (frmHome1.manejadorr2 == "POSTGRESQL")
            {
                frmHome1.contarid("SELECT COUNT(*) FROM [POSTGRESQL]...Purpose");
                idSujeto = frmHome1.count;
            }


            consulta = "EXEC INSERT_Purpose  '" + frmHome1.manejadorr2 + "','" + investigation + "','" + name + "'";

            frmHome1.EjecutarComando(consulta);
            LimpiarCampos();
            MostrarRegistros();
        }
        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtInvestigation.Text = "";
          

        }
        private bool CamposVacios()
        {
            return string.IsNullOrWhiteSpace(txtName.Text) ||
                   string.IsNullOrWhiteSpace(txtInvestigation.Text);
        }
        private void btnInsertar_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
            investigation = txtInvestigation.Text;
          

            InsertarRegistros();
        }
        private void ActualizarRegistros()
        {


            consulta = "EXEC UPDATE_Purpose '" +
                 frmHome1.manejadorr2 + "'," + id + ",'" + name + "','" + investigation +  "'," + status + "";


            frmHome1.EjecutarComando(consulta);

            datagridCareer.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
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
                name = row.Cells[2].Value?.ToString();
                investigation = row.Cells[3].Value?.ToString();
           


            }
            else
            {
                // Manejar el caso donde la conversión del estado falla
            }
            ActualizarRegistros();
        }
        private void Eliminar(int id)
        {

            consulta = "EXEC DELETE_Purpose '" + frmHome1.manejadorr2 + "','" + id + "'";

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
    }
}
