<%@ Page Title="Repeater Nested Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepeaterDisplay.aspx.cs" Inherits="WebApp.SamplePages.RepeaterDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Displaying a Nest Linq Query in a Repeater</h1>
    <%--to ease working with the properties in your class on this control use the ItemType attribute and assign the class name of your data definition
        
        HeaderTemplate is top of list 
        FooterTemplate is button of list 
        
        ItemTemplate occurs once per DTO record 
        ALternatingItemTemplate (every other record)--%>
    <asp:Repeater ID="AlbumTracksList" runat="server" DataSourceID="AlbumtracksListODS" ItemType="ChinookSystem.Data.DTOs.AlbumDTO">
        <HeaderTemplate>
            <h3>Albums and Tracks</h3>
        </HeaderTemplate>
        <ItemTemplate>
            <h5><strong>Album: <%# Item.AlbumTitle %></strong></h5>
            <p><strong>Artist: <%# Item.AlbumArtist %></strong>
                # of Tracks: <%# Item.TrackCount %>
                Play Time: <%# Item.PlayTime %>
            </p>
            <asp:GridView ID="TrackList" runat="server" DataSource ="<%# Item.AlbumsTracks %>" CssClass="table" GridLines="Horizontal" BorderStyle="None">
            </asp:GridView>
        </ItemTemplate>
        <FooterTemplate>
            &copy; DMIT2028 NAIT Course all rights reserved
        </FooterTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="AlbumtracksListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Album_AlbumAndTracks" TypeName="ChinookSystem.BLL.AlbumController">
    </asp:ObjectDataSource>
</asp:Content>
