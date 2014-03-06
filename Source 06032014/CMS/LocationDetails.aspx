<%@ Page Title="" Language="C#" MasterPageFile="~/Parent.master" AutoEventWireup="true" CodeFile="LocationDetails.aspx.cs" Inherits="LocationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cleft" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cbody" Runat="Server">
    <p>
        <br />
        Location Details :-</p>
    <p>
        <asp:GridView ID="gvlocation" runat="server">
        </asp:GridView>
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cfooter" Runat="Server">
</asp:Content>

