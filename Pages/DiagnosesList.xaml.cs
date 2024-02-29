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
using Poliklinika.Class;
using Poliklinika.Entity;

namespace Poliklinika.Pages
{
    /// <summary>
    /// Логика взаимодействия для DiagnosesList.xaml
    /// </summary>
    public partial class DiagnosesList : Page
    {
        public DiagnosesList()
        {
            InitializeComponent();
            DGridDiagnoses.ItemsSource = PoliklinikaEntities.GetContext().Diagnoses.ToList();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
