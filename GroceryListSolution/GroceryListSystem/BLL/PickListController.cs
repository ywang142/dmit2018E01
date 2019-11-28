using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using GroceryListSystem.DAL;
using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using System.ComponentModel;
#endregion

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class PickListController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<PickList> OrderLists_OrderPickList(int orderid)
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.OrderLists
                            where x.OrderID == orderid
                              select new PickList
                              {
                                  OrderID = x.OrderID,
                                  Product = x.Product.Description,
                                  Qty = x.QtyOrdered,
                                  Comment = x.CustomerComment,
                                  Picked = x.QtyPicked,
                                  PickIssue =  x.PickIssue
                              };
                return results.ToList();
            }
        }
    }
}
