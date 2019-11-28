using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryList.Data.POCOs
{
    public class PickList
    {
        public int OrderID { get; set; }

        public string Product { get; set; }

        public double Qty { get; set; }

        public string Comment { get; set; }

        public double Picked { get; set; }


        public string PickIssue { get; set; }

    }
}
