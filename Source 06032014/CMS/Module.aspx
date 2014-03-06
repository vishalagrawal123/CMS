<%@ Page Title="" Language="C#" MasterPageFile="~/Parent.master" AutoEventWireup="true" CodeFile="Module.aspx.cs" Inherits="Module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cbody" Runat="Server">
    <div id="workarea">

    <table class="style1">
        <tr>
            <td>
             <a id="emp" href="Employee/Employee.aspx">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/Employee.png" />
             </a>
             
            </td>
            <td>
                 <a id="A1" href="Certification/Certification.aspx">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Img/Certification.png" />
                </a>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cfooter" Runat="Server">
</asp:Content>

