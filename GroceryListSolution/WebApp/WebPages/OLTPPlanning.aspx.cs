using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GroceryListSystem.BLL;
using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;

namespace WebApp.WebPages
{
    public partial class OLTPPlanning : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ArtistFetch_Click(object sender, EventArgs e)
        {
            CustomerController CustomerController = new CustomerController();
            Customer CustomerInfo = new Customer();
            CustomerInfo = CustomerController.Customer_Get(int.Parse(CustomerID.SelectedValue));
            CustomerName.Text = "Customer: " + CustomerInfo.FullName;
            Contact.Text = CustomerInfo.Phone;

            PickListController sysmgr = new PickListController();
            List<PickList> datainfo = new List<PickList>();
            datainfo = sysmgr.OrderLists_OrderPickList(CustomerID.SelectedIndex);
            


        }
    }
}