<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayArtistAlbums.aspx.cs" Inherits="WebApp.SamplePages.DisplayArtistAlbums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Enter your artist name (or "></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="ArtistName" runat="server" placeholder ="artist name"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button ID="Fetch" runat="server" Text="Fetch" CssClass="" />
    <asp:GridView ID="ArtistAlbumsList" runat="server" DataSourceID="ArtistAlbumsListODS" AutoGenerateColumns="False" AllowPaging="True" PageSize="5">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="ArtistName" HeaderText="ArtistName" SortExpression="ArtistName"></asp:BoundField>
            <asp:BoundField DataField="Ryear" HeaderText="Ryear" SortExpression="Ryear"></asp:BoundField>
            <asp:BoundField DataField="RLabel" HeaderText="RLabel" SortExpression="RLabel"></asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No data availabel for 
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ArtistAlbumsListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Album_AlbumsOfArtist" TypeName="ChinookSystem.BLL.AlbumController">
        <SelectParameters>
            <asp:ControlParameter ControlID="ArtistName" PropertyName="Text" DefaultValue="sfasdf" Name="artistname" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
