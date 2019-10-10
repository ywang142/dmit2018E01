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
    public class ProductController
    {

        #region Queries
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Product_List()
        {

            using (var context = new GroceryListContext())
            {
                return context.Products.ToList();
            }
        }

        public Product Product_Get(int productid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.Find(productid);
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Product_FindByCategory(int categoryid)
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.Products
                              where x.CategoryID == categoryid
                              select x;
                return results.ToList();
            }
        }
#endregion

        #region Add, Update Delete
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public int Product_Add(Product item)
        {
            using (var context = new GroceryListContext())
            {
                    context.Products.Add(item);   // staging
                    context.SaveChanges();      // committed
                    return item.ProductID;        // return new id value
            }
        }
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public int Product_Update(Product item)
        {
            using (var context = new GroceryListContext())
            {
                    context.Entry(item).State = System.Data.Entity.EntityState.Modified;
                    return context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public int Product_Delete(Product item)
        {
            return Product_Delete(item.ProductID);
        }
        // [DataObjectMethod(DataObjectMethodType.Delete, false)] the current delete is taking in a single int
        public int Product_Delete(int productid)
        {
            using (var context = new GroceryListContext())
            {
                var product = context.Products.Find(productid);
                if (product == null)
                {
                    throw new Exception("Product not on file. Delete unnecessary.");
                }
                else
                {
                    context.Products.Remove(product);
                    return context.SaveChanges();
                }

            }
        }
        #endregion

    }
}
