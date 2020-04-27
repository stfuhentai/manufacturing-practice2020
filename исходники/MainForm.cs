using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data.Common;
namespace kurs
{
    public partial class MainForm : Form
    {
        string log;
        string chek;
        public MainForm()
        {
            InitializeComponent();
        }

        private void UpdateList()
        {
            string pan;
            DB db = new DB();
            MySqlCommand command = new MySqlCommand("SELECT message , Name, Data FROM `message` ORDER BY `ID`", db.getConnection());
            db.openConnection();
            MySqlDataReader reader = command.ExecuteReader();
            listView.Items.Clear();
            foreach (DbDataRecord message in reader)
            {
                var lvi = new ListViewItem();
                lvi.Text = reader["message"].ToString();
                lvi.SubItems.Add(reader["Name"].ToString());

                var lvsi = new ListViewItem.ListViewSubItem();
                lvsi.Text = reader["Data"].ToString();
                lvsi.Tag = reader["Data"].ToString();
                lvi.SubItems.Add(lvsi);

                listView.Items.Add(lvi);
                //lvi.SubItems.Add(reader["ID"].ToString());
            }
            db.closeConnection();
        }

        private void listView_DoubleClick(object sender, EventArgs e)
        {
            MessageBox.Show("Сообщение:" + '\n' + listView.SelectedItems[0].Text + '\n' + '\n' + "Отправил: " + listView.SelectedItems[0].SubItems[1].Text + " - " + (String)listView.SelectedItems[0].SubItems[2].Tag);

        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            UpdateList();
            DB db = new DB();
            MySqlCommand command = new MySqlCommand("SELECT accounts.Name FROM accounts, templogin WHERE accounts.login = templogin.login", db.getConnection());
            db.openConnection();
            object result = command.ExecuteScalar();
            log = Convert.ToString(result);
            chek = log;
            //textBox.MaxLength = 20;
            //label3.Text = log.ToString();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void buttonSend_Click(object sender, EventArgs e)
        {
            DateTime registrationDate = DateTime.Now;
            if (textBox.Text == "")
            {
                MessageBox.Show("Поле с текстом должно быть заполнено");
                return;
            }
            
            DB db = new DB();
            MySqlCommand command = new MySqlCommand("INSERT INTO `message` (`message`, `Name`, `Data`) VALUES (@text, @log, @Data)", db.getConnection());
            command.Parameters.Add("@text", MySqlDbType.VarChar).Value = Convert.ToString(textBox.Text);
            command.Parameters.Add("@log", MySqlDbType.VarChar).Value = log.ToString();
            command.Parameters.Add("@Data", MySqlDbType.VarChar).Value = registrationDate.ToString();
            db.openConnection();
            command.ExecuteNonQuery();
            db.closeConnection();

            UpdateList();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void listView_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void checkBox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender; // приводим отправителя к элементу типа CheckBox
            if (checkBox.Checked == true)
            {
                MessageBox.Show(checkBox.Text + " активно");
                log = "User";
            }
            else
            {
                MessageBox.Show(checkBox.Text + " не активно");
                log = chek;
            }
        }
    }
}
