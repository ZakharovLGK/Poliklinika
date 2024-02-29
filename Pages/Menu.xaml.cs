using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Poliklinika.Pages;
using Poliklinika.Class;

namespace Poliklinika.Pages
{
    /// <summary>
    /// Логика взаимодействия для Menu.xaml
    /// </summary>
    public partial class Menu : Page
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void BtnDoctor_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new DoctorList());
        }

        private void BtnPatient_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new PatientList());
        }

        private void BtnDignoses_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new DiagnosesList());
        }

        private void BtnOtdel_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new OtdelList());
        }

        private void BtnHistory_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HistoryList());
        }
    }
}
