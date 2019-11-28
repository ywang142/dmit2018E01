using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using GroceryListSystem.DAL;
using GroceryList.Data.Entities;
using System.ComponentModel;
#endregion

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class PickerController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Picker> Picker_List()
        {

            using (var context = new GroceryListContext())
            {
                return context.Pickers.ToList();
            }
        }
    }
}
