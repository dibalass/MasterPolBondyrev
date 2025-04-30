using System;
using System.Collections.Generic;

namespace MasterPol.Models;

public partial class PartnersImport
{
    public string Тип_партнера { get; set; } = null!;

    public string Наименование_партнера { get; set; } = null!;

    public string Директор { get; set; } = null!;

    public string ЭлектроннаяПочтаПартнера { get; set; } = null!;

    public string Телефон_партнера { get; set; }

    public string ЮридическийАдресПартнера { get; set; } = null!;

    public decimal Инн { get; set; }

    public int Рейтинг { get; set; }
}
