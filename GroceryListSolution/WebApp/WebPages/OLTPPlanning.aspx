<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OLTPPlanning.aspx.cs" Inherits="WebApp.WebPages.OLTPPlanning" %>

<%@ Register Src="~/UserControl/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>Manage Playlists (UI/UX TRX Sample)<asp:Label ID="CustomerName" runat="server"></asp:Label></h1>
    </div>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

    <div class="row">
        <div class="row-sm-4">
            <div class="col-sm-1">
                <asp:Label ID="Label1" runat="server" Text="OrderNumber"></asp:Label>
            </div>
            <div class="col-sm-1">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="50px" DataSourceID="OrderDLL" DataTextField="OrderID" DataValueField="OrderID"></asp:DropDownList>
               <br />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="ArtistFetch" runat="server" Text="Fetch" />
            </div>
        </div>
        <div class="row-sm-5">
            <div class="col-sm-2">
                <asp:Label ID="Label2" runat="server" Text="Customer:Doe, Jane"></asp:Label>
            </div>
            <div class="col-sm-3">
                <asp:Label ID="Label3" runat="server" Text="Contact: 123:123:123"></asp:Label>
            </div>

        </div>
        <div class="row-sm-3">
            <div class="col-sm-1">
                <asp:Label ID="Label4" runat="server" Text="Picker"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="150px"></asp:DropDownList>
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView><br />

        <asp:Button ID="Button1" runat="server" Text="Save" />
     </div>
    <asp:ObjectDataSource ID="OrderDLL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Order_List" TypeName="GroceryListSystem.BLL.OrderController"></asp:ObjectDataSource>
            

</asp:Content>
