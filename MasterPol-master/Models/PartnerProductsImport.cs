using System;
using System.Collections.Generic;

namespace MasterPol.Models;

public partial class PartnerProductsImport
{
    public int Id { get; set; }

    public string Продукция { get; set; } = null!;

    public string Наименование_партнера { get; set; } = null!;

    public int Количество_продукции { get; set; }

    public DateOnly ДатаПродажи { get; set; }
}
