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
                                  OrderListID = x.OrderListID,
                                  Product = x.Product.Description,
                                  Qty = x.QtyOrdered,
                                  Comment = x.CustomerComment,
                                  Picked = x.QtyPicked,
                                  PickIssue =  x.PickIssue
                              };
                return results.ToList();
            }
        }
        public void OrderLists_Picking(int pickerid, int orderid, List<PickList> picklist)
        {
            using(var context = new GroceryListContext())
            {
                double Total = 0;

                foreach(PickList item in picklist)
                {
                    var exists = (from x in context.OrderLists
                                  where x.OrderListID == item.OrderListID
                                  select x).FirstOrDefault();

                    if (!(item.Picked < 0))
                    {
                        if(!(exists.QtyPicked == item.Picked))
                        {
                            if(exists.QtyPicked < item.Picked)
                            {
                                Total += (double)(exists.Price - exists.Discount) * (item.Picked - exists.QtyPicked);
                            }
                            else
                            {
                                Total -= (double)(exists.Price - exists.Discount) * (exists.QtyPicked - item.Picked);
                            }
                            exists.QtyPicked = item.Picked;
                            context.Entry(exists).Property(y => y.QtyPicked).IsModified = true;
                        }
                    }
                    if (!(exists.PickIssue == item.PickIssue))
                    {
                        exists.PickIssue = item.PickIssue;
                        context.Entry(exists).Property(y => y.PickIssue).IsModified = true;
                    }
                    
                }

                Order currentOrder = context.Orders.Find(orderid);
                currentOrder.PickedDate = DateTime.Now;
                currentOrder.PickerID = pickerid;
                currentOrder.SubTotal += (decimal)Total;
                if(currentOrder.SubTotal< 0)
                {
                    currentOrder.SubTotal = 0;
                }
                if(currentOrder.SubTotal < 0)
                {
                    currentOrder.GST = 0;
                }
                else
                {
                    currentOrder.GST = (decimal)(currentOrder.SubTotal) * (decimal)0.05;
                }
                context.Entry(currentOrder).Property(y => y.PickerID).IsModified = true;
                context.Entry(currentOrder).Property(y => y.PickedDate).IsModified = true;
                context.Entry(currentOrder).Property(y => y.SubTotal).IsModified = true;
                context.Entry(currentOrder).Property(y => y.GST).IsModified = true;
                context.SaveChanges();
            }
        }
    }
}
