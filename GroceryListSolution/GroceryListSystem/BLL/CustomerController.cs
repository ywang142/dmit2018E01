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
    public class CustomerController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Customer> Customer_List()
        {

            using (var context = new GroceryListContext())
            {
                return context.Customers.ToList();
            }
        }

        public Customer Customer_Get(int customerid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Customers.Find(customerid);
            }
        }
    }
}
