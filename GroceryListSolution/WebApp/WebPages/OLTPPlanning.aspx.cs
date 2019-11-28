using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using GroceryListSystem.BLL;
using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using DMIT2018Common.UserControls;
#endregion


namespace WebApp.WebPages
{
    public partial class OLTPPlanning : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
        {
            MessageUserControl.HandleDataBoundException(e);
        }

        protected void ArtistFetch_Click(object sender, EventArgs e)
        {

            MessageUserControl.TryRun(() =>
            {
                OrderController OrderController = new OrderController();
                Order datainfo = OrderController.Order_Get(int.Parse(CustomerID.SelectedValue));

                CustomerController CustomerController = new CustomerController();
                Customer CustomerInfo = CustomerController.Customer_Get(datainfo.CustomerID);
                CustomerName.Text = "Customer: " + CustomerInfo.FullName;
                Contact.Text = CustomerInfo.Phone;
                ListView1.DataSourceID = "ObjectDataSource1";
            });
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            PickListController sysmgr = new PickListController();
            List<PickList> PicklistItems = new List<PickList>();
            float a = 0;
            List<string> reasons = new List<string>();
            foreach (ListViewItem item in ListView1.Items)
            {

                PickList PicklistItem = new PickList();
                PicklistItem.OrderID = int.Parse((item.FindControl("OrderIDLabel") as Label).Text);
                PicklistItem.OrderListID = int.Parse((item.FindControl("OrderListIDLabel") as Label).Text);
                PicklistItem.Product = (item.FindControl("ProductLabel") as Label).Text;
                PicklistItem.Qty = double.Parse((item.FindControl("QtyLabel") as Label).Text);
                PicklistItem.Comment = (item.FindControl("CommentLabel") as Label).Text;
                if (float.TryParse((item.FindControl("TextBox1") as TextBox).Text, out a))
                {
                    PicklistItem.Picked = float.Parse((item.FindControl("TextBox1") as TextBox).Text);
                    if (PicklistItem.Picked < 0)
                    {
                        reasons.Add("Product: '" + PicklistItem.Product + "': Picked can not be less than 0");
                    }
                }
                else
                {
                    PicklistItem.Picked = -1;
                    reasons.Add("Product: '" + PicklistItem.Product + "': Picked number can only be an interger!");

                }
                if (reasons.Count>0)
                {
                    MessageUserControl.TryRun(() =>
                    {
                        throw new BusinessRuleException("Save Error: ", reasons);
                    });
                }

                PicklistItem.PickIssue = (item.FindControl("TextBox2") as TextBox).Text;
                PicklistItems.Add(PicklistItem);
            }

            ListView2.DataSource = PicklistItems;
            ListView2.DataBind();

            MessageUserControl.TryRun(() =>
            {
                sysmgr.OrderLists_Picking(int.Parse(DropDownList2.SelectedValue), PicklistItems[0].OrderID, PicklistItems);
            });
            

        }
    }
}