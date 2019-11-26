<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDODS.aspx.cs" Inherits="WebApp.WebPages.CRUDODS" %>

<%@ Register Src="~/UserControl/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Insert, Update and Delete</h1>
    <br />
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    <br />
    <br />
    <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server" HeaderText="Correct the following concerns on the insert record" ValidationGroup="IGroup" />
    <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" HeaderText="Correct the following concerns on the Edit record" ValidationGroup="EGroup" />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ProductList" InsertItemPosition="LastItem" DataKeyNames="ProductID">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF; color: #284775;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton"
                        OnClientClick="return confirm('Are you sure you wish to delete?')" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Width="30px" Enabled="false" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="200px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price", "{0:0.00 }") %>' runat="server" ID="PriceLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount", "{0:0.00 }") %>' runat="server" ID="DiscountLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" Width="100px" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoriesList"
                        DataTextField="Description"
                        DataValueField="CategoryID"
                        SelectedValue='<%# Eval("CategoryID") %>'
                        Enabled="false" Width="150px">
                    </asp:DropDownList>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" Width="30px" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <asp:RequiredFieldValidator ID="RequiredDescriptionTextBoxE" runat="server" ErrorMessage="Description is required" Display="None" ControlToValidate="DescriptionTextBoxE"
                ValidationGroup="EGroup"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExDescriptionTextBoxE" runat="server" ErrorMessage="Description is limited to 100 characters" Display="None"
                ControlToValidate="DescriptionTextBoxE" ValidationGroup="EGroup" ValidationExpression="^.{1,100}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredUnitSizeTextBoxE" runat="server" ErrorMessage="Unit size is required" Display="None" ControlToValidate="UnitSizeTextBoxE"
                ValidationGroup="EGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredPriceTextBoxE" runat="server" ErrorMessage="Price is required" Display="None" ControlToValidate="PriceTextBoxE"
                ValidationGroup="EGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredDiscountTextBoxE" runat="server" ErrorMessage="Discount is required" Display="None" ControlToValidate="DiscountTextBoxE"
                ValidationGroup="EGroup"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareDiscountGreaterThanZeroE" runat="server" ErrorMessage="Discount must be greater than 0" Type="Double"
                 ValidationGroup="EGroup" ControlToValidate="DiscountTextBoxE" ValueToCompare="0" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>

<%--            <asp:CompareValidator ID="ComparePriceGreaterThanZero" runat="server" ErrorMessage="Price must be greater than 0" Type="Double"
                 ValidationGroup="EGroup" ControlToValidate="PriceTextBoxE" ValueToCompare="0" Operator="GreaterThan" Display="None"></asp:CompareValidator>--%>
            <asp:CompareValidator ID="ComparePriceDiscountE" runat="server"
                ErrorMessage="Discount can not be greater than item price!" ValidationGroup="EGroup" Type="Double"
                ControlToValidate="PriceTextBoxE" ControlToCompare="DiscountTextBoxE" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" ValidationGroup="EGroup" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBox" Enabled="false" Width="30px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxE" Width="200px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price", "{0:0.00 }") %>' runat="server" ID="PriceTextBoxE" Width="100px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount", "{0:0.00 }") %>' runat="server" ID="DiscountTextBoxE" Width="100px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxE" Width="100px" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoriesList"
                        DataTextField="Description"
                        DataValueField="CategoryID"
                        SelectedValue='<%# Bind("CategoryID") %>'
                        Enabled="true" Width="150px">
                    </asp:DropDownList>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" Width="30px" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:RequiredFieldValidator ID="RequiredDescriptionTextBoxI" runat="server" ErrorMessage="Description is required" Display="None" ControlToValidate="DescriptionTextBoxI"
                ValidationGroup="IGroup"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExDescriptionTextBoxI" runat="server" ErrorMessage="Description is limited to 100 characters" Display="None"
                ControlToValidate="DescriptionTextBoxI" ValidationGroup="IGroup" ValidationExpression="^.{1,100}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredPriceTextBoxI" runat="server" ErrorMessage="Price is required" Display="None" ControlToValidate="PriceTextBoxI"
                ValidationGroup="IGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredDiscountTextBoxI" runat="server" ErrorMessage="Discount is required" Display="None" ControlToValidate="DiscountTextBoxI"
                ValidationGroup="IGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredUnitSizeTextBoxI" runat="server" ErrorMessage="Unit size is required" Display="None" ControlToValidate="UnitSizeTextBoxI"
                ValidationGroup="IGroup"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareDiscountGreaterThanZeroI" runat="server" ErrorMessage="Discount must be greater or equal to 0" Type="Double"
                 ValidationGroup="IGroup" ControlToValidate="DiscountTextBoxI" ValueToCompare="0" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>
<%--            <asp:CompareValidator ID="ComparePriceGreaterThanZeroI" runat="server" ErrorMessage="Price must be greater than 0"
                 ValidationGroup="IGroup" ControlToValidate="PriceTextBoxI" ValueToCompare="0" Operator="GreaterThan" Display="None"></asp:CompareValidator>--%>
            <asp:CompareValidator ID="ComparePriceDiscountI" runat="server"
                ErrorMessage="Discount can not be greater than price" ValidationGroup="IGroup" Type="Double"
                ControlToValidate="PriceTextBoxI" ControlToCompare="DiscountTextBoxI" Operator="GreaterThanEqual" Display="None"></asp:CompareValidator>

            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" ValidationGroup="IGroup" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBoxI" Enabled="false" Width="30px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxI" Width="200px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price", "{0:0.00 }") %>' runat="server" ID="PriceTextBoxI" Width="100px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount", "{0:0.00 }") %>' runat="server" ID="DiscountTextBoxI" Width="100px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxI" Width="100px" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoriesList"
                        DataTextField="Description"
                        DataValueField="CategoryID"
                        SelectedValue='<%# Bind("CategoryID") %>'
                        Enabled="true" Width="150px">
                    </asp:DropDownList></td>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" Width="30px" /></td>

            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF; color: #333333;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Width="30px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="200px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price", "{0:0.00 }") %>' runat="server" ID="PriceLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount", "{0:0.00 }") %>' runat="server" ID="DiscountLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" Width="100px" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoriesList"
                        DataTextField="Description"
                        DataValueField="CategoryID"
                        SelectedValue='<%# Eval("CategoryID") %>'
                        Enabled="false" Width="150px">
                    </asp:DropDownList></td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" Width="30px" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">ProductID</th>
                                <th runat="server">Description</th>
                                <th runat="server">Price</th>
                                <th runat="server">Discount</th>
                                <th runat="server">UnitSize</th>
                                <th runat="server">Category</th>
                                <th runat="server">Taxable</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Width="30px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="200px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price", "{0:0.00 }") %>' runat="server" ID="PriceLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount", "{0:0.00 }") %>' runat="server" ID="DiscountLabel" Width="100px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" Width="100px" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server"
                        DataSourceID="CategoriesList"
                        DataTextField="Description"
                        DataValueField="CategoryID"
                        SelectedValue='<%# Eval("CategoryID") %>'
                        Enabled="false" Width="150px">
                    </asp:DropDownList></td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" Width="30px" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>



    <asp:ObjectDataSource ID="CategoriesList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="GroceryListSystem.BLL.CategoryController" OnDeleted="DeleteCheckForException"
        OnInserted="InsertCheckForException"
        OnUpdated="UpdateCheckForException"
        OnSelected="CheckForException"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProductList" runat="server" DataObjectTypeName="GroceryList.Data.Entities.Product" DeleteMethod="Product_Delete" InsertMethod="Product_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="Product_List" TypeName="GroceryListSystem.BLL.ProductController" UpdateMethod="Product_Update"></asp:ObjectDataSource>
</asp:Content>
