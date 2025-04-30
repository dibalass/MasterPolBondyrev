using MasterPol.Data;
using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterPol
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private AppDbContext _context;

        public MainWindow()
        {
            InitializeComponent();
            _context = new AppDbContext();
            ЗагрузитьПартнеров();
        }
        private void ЗагрузитьПартнеров()
        {
            try
            {
                var партнеры = _context.PartnersImports.ToList();
                var продуктыПартнеров = _context.PartnerProductsImports.ToList();

                var модели = new List<МодельПартнера>();

                foreach (var п in партнеры)
                {
                    int общиеПродажи = продуктыПартнеров
                        .Where(пп => пп.Наименование_партнера == п.Наименование_партнера)
                        .Sum(пп => пп.Количество_продукции);

                    int скидка = РассчитатьСкидку(общиеПродажи);

                    модели.Add(new МодельПартнера
                    {
                        Наименование = п.Наименование_партнера,
                        ТипИНазвание = $"# {п.Тип_партнера} | {п.Наименование_партнера}",
                        Телефон = ФорматироватьТелефон(п.Телефон_партнера?.ToString()),
                        Рейтинг = $"Рейтинг: {п.Рейтинг}",
                        Скидка = $"{скидка}%"
                    });
                }

                СписокПартнеров.ItemsSource = модели;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке данных: {ex.Message}");
            }
        }

        private int РассчитатьСкидку(int объемПродаж)
        {
            if (объемПродаж > 300000) return 15;
            if (объемПродаж >= 50000) return 10;
            if (объемПродаж >= 10000) return 5;
            return 0;
        }

        private string ФорматироватьТелефон(string телефон)
        {
            if (string.IsNullOrEmpty(телефон)) return "Телефон не указан";

            // Удаляем все нецифровые символы
            var цифры = new string(телефон.Where(c => char.IsDigit(c)).ToArray());

            if (цифры.Length >= 10)
            {
                // Формат: +7 223 322 22 32
                return $"+7 {цифры.Substring(0, 3)} {цифры.Substring(3, 3)} {цифры.Substring(6, 2)} {цифры.Substring(8)}";
            }

            return телефон;
        }
    }

    public class МодельПартнера
    {
        public string Наименование { get; set; }
        public string ТипИНазвание { get; set; }
        public string Телефон { get; set; }
        public string Рейтинг { get; set; }
        public string Скидка { get; set; }
    }

}