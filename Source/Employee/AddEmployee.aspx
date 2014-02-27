<%@ Page Title="" Language="C#" MasterPageFile="~/Parent.master" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="Employee_AddEmployee" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 336px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cbody" Runat="Server">
    <div>


    <table class="style1">
        <tr>
            <td class="style2" colspan="3">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;</td>
            <td>
                <asp:Label ID="Label12" runat="server" ForeColor="Red" 
                    Text="Note:-All fields are mandatory"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="MID       :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtmid" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtmid" ErrorMessage="Plz Enter MID Number" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Name :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtname" ErrorMessage="Plz Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtname" ErrorMessage="Enter Only Characters" 
                    ForeColor="Red" ValidationExpression="[a-z A-Z]\w"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Competency :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtcompetency" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtcompetency" ErrorMessage="Plz Enter Competency" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="Location :"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;<asp:DropDownList ID="ddlocation" runat="server" AutoPostBack="True" 
                    Height="26px" Width="125px">
                </asp:DropDownList>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Vertical :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtvertical" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtvertical" ErrorMessage="Plz Enter Vertical" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="Customer Name :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtcustname" runat="server" 
                    ontextchanged="txtcustname_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcustname" ErrorMessage="Plz Enter Customer Name" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtcustname" ErrorMessage="Enter Only Characters" 
                    ForeColor="Red" ValidationExpression="[a-z A-Z]\w"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="Project Name :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtprojname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtprojname" ErrorMessage="Plz Enter Project Name" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label9" runat="server" Text="Delivery Manager :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtdeliverymanager" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtdeliverymanager" 
                    ErrorMessage="Plz Enter Delivery Manager Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="Account Category :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtaccCate" runat="server" 
                    ontextchanged="txtaccCate_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtaccCate" ErrorMessage="Plz Enter Account Category" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label11" runat="server" Text="IsActive :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtIsactive" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtIsactive" ErrorMessage="Plz Enter IsActive Number" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtIsactive" ErrorMessage="Enter numbers only" 
                    ForeColor="Red" ValidationExpression="[0-9]"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/save.png" 
                    onclick="ImageButton1_Click" />
            </td>
            <td class="style3">
                &nbsp;
                <br />
                <br />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Img/cancel.png" 
                    onclick="ImageButton2_Click" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>


</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cfooter" Runat="Server">
</asp:Content>

