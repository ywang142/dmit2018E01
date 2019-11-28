<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OLTPPlanning.aspx.cs" Inherits="WebApp.WebPages.OLTPPlanning" %>

<%@ Register Src="~/UserControl/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>OTLP Exercise<asp:Label ID="Label10" runat="server"></asp:Label></h1>
    </div>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

    <div class="row">
        <div class="row-sm-4">
            <div class="col-sm-1">
                <asp:Label ID="Label1" runat="server" Text="OrderNumber"></asp:Label>
            </div>
            <div class="col-sm-1">
                <asp:DropDownList ID="CustomerID" runat="server" Width="50px" DataSourceID="OrderDLL" DataTextField="OrderID" DataValueField="CustomerID"></asp:DropDownList>
                <br />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="ArtistFetch" runat="server" Text="Fetch" OnClick="ArtistFetch_Click" />
            </div>
        </div>
        <div class="row-sm-5">
            <div class="col-sm-2">
                <asp:Label ID="CustomerName" runat="server" Text="Customer:"></asp:Label>
            </div>
            <div class="col-sm-3">
                <asp:Label ID="Contact" runat="server" Text="Contact: "></asp:Label>
            </div>

        </div>
        <div class="row-sm-3">
            <div class="col-sm-1">
                <asp:Label ID="Label4" runat="server" Text="Picker"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="150px" DataSourceID="PickerDLL" DataTextField="FullName" DataValueField="PickerID"></asp:DropDownList>
            </div>
        </div>

    </div>
    <div>
    
    </div>
    <asp:Button CssClass="btn-primary" ID="Button1" runat="server" Text="Save" />

    <asp:ObjectDataSource ID="OrderDLL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Order_List" TypeName="GroceryListSystem.BLL.OrderController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PickerDLL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Picker_List" TypeName="GroceryListSystem.BLL.PickerController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OrderListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="OrderLists_OrderPickList" TypeName="GroceryListSystem.BLL.PickListController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomerID" PropertyName="SelectedIndex" Name="orderid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
