<%@ Page Title="Query:ODS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryODS.aspx.cs" Inherits="WebApp.WebPages.QueryODS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Query:ODS</h1>
            <asp:Label ID="label1" runat="server" Text="Select a category:"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoriesList" DataTextField="Description" DataValueField="CategoryID"></asp:DropDownList>
        &nbsp;&nbsp;
        <asp:LinkButton ID="FetchCategories" runat="server" CausesValidation="false">Fetch Categories</asp:LinkButton>
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ProductList" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount"></asp:BoundField>
            <asp:BoundField DataField="UnitSize" HeaderText="UnitSize" SortExpression="UnitSize"></asp:BoundField>
            <asp:CheckBoxField DataField="Taxable" HeaderText="Taxable" SortExpression="Taxable" ></asp:CheckBoxField>
        </Columns>
        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#EFF3FB"></RowStyle>

        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:ObjectDataSource ID="CategoriesList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="GroceryListSystem.BLL.CategoryController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProductList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Product_FindByCategory" TypeName="GroceryListSystem.BLL.ProductController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryList" PropertyName="SelectedValue" DefaultValue="0" Name="categoryid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
