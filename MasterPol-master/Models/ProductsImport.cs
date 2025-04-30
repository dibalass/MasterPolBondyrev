using System;
using System.Collections.Generic;

namespace MasterPol.Models;

public partial class ProductsImport
{
    public string ТипПродукции { get; set; } = null!;

    public string НаименованиеПродукции { get; set; } = null!;

    public int Артикул { get; set; }

    public decimal МинимальнаяСтоимостьДляПартнера { get; set; }
}
