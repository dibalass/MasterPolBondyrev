using System;
using System.Collections.Generic;

namespace MasterPol.Models;

public partial class ProductTypeImport
{
    public string ТипПродукции { get; set; } = null!;

    public decimal? КоэффициентТипаПродукции { get; set; }
}
