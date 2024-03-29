﻿using System;
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
    public class OrderController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Order> Order_List()
        {
            using (var context = new GroceryListContext())
            {
                var results = (from x in context.Orders
                               where x.PickerID.Equals(null)
                               && x.PickedDate.Equals(null)
                               select x);
                return results.ToList();

            }
        }

        public Order Order_Get(int orderid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Orders.Find(orderid);
            }
        }
    }
}
