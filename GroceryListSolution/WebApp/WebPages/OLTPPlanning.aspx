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
                <asp:DropDownList ID="CustomerID" runat="server" Width="50px" DataSourceID="OrderDLL" DataTextField="OrderID" DataValueField="OrderID"></asp:DropDownList>
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
        <asp:ListView ID="ListView1" runat="server" >
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                                    <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                    <td>
                        <asp:TextBox ID="TextBox1" Text='<%# Eval("Picked") %>' runat="server"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# Eval("PickIssue") %>' runat="server"></asp:TextBox></td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                                    <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                    <td>
                        <asp:TextBox ID="TextBox1" Text='<%# Eval("Picked") %>' runat="server"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# Eval("PickIssue") %>' runat="server"></asp:TextBox></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">OrderID</th>
                                    <th runat="server">OrderListID</th>
                                    <th runat="server">Product</th>
                                    <th runat="server">Qty</th>
                                    <th runat="server">Comment</th>
                                    <th runat="server">Picked</th>
                                    <th runat="server">PickIssue</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                                    <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                    <td>
                        <asp:TextBox ID="TextBox1" Text='<%# Eval("Picked") %>' runat="server"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# Eval("PickIssue") %>' runat="server"></asp:TextBox></td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <asp:Button CssClass="btn-primary" ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
    <asp:ListView ID="ListView2" runat="server">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Picked") %>' runat="server" ID="PickedLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PickIssue") %>' runat="server" ID="PickIssueLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("OrderID") %>' runat="server" ID="OrderIDTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("OrderListID") %>' runat="server" ID="OrderListIDTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Product") %>' runat="server" ID="ProductTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Qty") %>' runat="server" ID="QtyTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Comment") %>' runat="server" ID="CommentTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Picked") %>' runat="server" ID="PickedTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PickIssue") %>' runat="server" ID="PickIssueTextBox" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("OrderID") %>' runat="server" ID="OrderIDTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("OrderListID") %>' runat="server" ID="OrderListIDTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Product") %>' runat="server" ID="ProductTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Qty") %>' runat="server" ID="QtyTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Comment") %>' runat="server" ID="CommentTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Picked") %>' runat="server" ID="PickedTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PickIssue") %>' runat="server" ID="PickIssueTextBox" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Picked") %>' runat="server" ID="PickedLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PickIssue") %>' runat="server" ID="PickIssueLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server">OrderID</th>
                                <th runat="server">OrderListID</th>
                                <th runat="server">Product</th>
                                <th runat="server">Qty</th>
                                <th runat="server">Comment</th>
                                <th runat="server">Picked</th>
                                <th runat="server">PickIssue</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("OrderListID") %>' runat="server" ID="OrderListIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="ProductLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Picked") %>' runat="server" ID="PickedLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PickIssue") %>' runat="server" ID="PickIssueLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="OrderDLL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Order_List" TypeName="GroceryListSystem.BLL.OrderController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PickerDLL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Picker_List" TypeName="GroceryListSystem.BLL.PickerController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="OrderLists_OrderPickList" TypeName="GroceryListSystem.BLL.PickListController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomerID" PropertyName="SelectedValue" Name="orderid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
