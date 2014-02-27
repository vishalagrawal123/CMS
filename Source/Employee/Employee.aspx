<%@ Page Title="" Language="C#" MasterPageFile="~/Parent.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Employee_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cbody" Runat="Server">
<div>

    <asp:Label ID="lblmsg" runat="server"></asp:Label>

</div>
    <div>
    Employee Details :-<br />
    
    
    <asp:GridView ID="gvemp" runat="server" oninit="gvemp_SelectedIndexChanged" 
        onrowediting="gvemp_RowEditing1" onrowupdating="gvemp_RowUpdating" 
        ondisposed="gvemp_Disposed" AutoGenerateColumns="False" 
        onpageindexchanged="gvemp_SelectedIndexChanged" 
        onrowcancelingedit="gvemp_RowCancelingEdit" onrowupdated="gvemp_RowUpdated1" 
        onselectedindexchanged="gvemp_SelectedIndexChanged">
        <Columns>
           <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
            <asp:TemplateField HeaderText="EmpId"><ItemTemplate>
                    <asp:Label ID="lblEmpId" runat="server" Text='<%# Eval("EmpId") %>'></asp:Label>
                </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="MID">
             <EditItemTemplate>
                    <asp:TextBox ID="txtMID" runat="server" 
                        Text='<%# Eval("MID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblEditMID" runat="server" Text='<%# Eval("MID") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
             <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" 
                        Text='<%# Eval("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Competency">
             <EditItemTemplate>
                    <asp:TextBox ID="txtCompetency" runat="server" 
                        Text='<%# Eval("Competency") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCompetency" runat="server" Text='<%# Eval("Competency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Location">
           <EditItemTemplate>
                    <asp:TextBox ID="txtLocation" runat="server" 
                        Text='<%# Eval("Location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vertical">
          <EditItemTemplate>
                    <asp:TextBox ID="txtVertical" runat="server" 
                        Text='<%# Eval("Vertical") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblVertical" runat="server" Text='<%# Eval("Vertical") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CustomerName">
           <EditItemTemplate>
                    <asp:TextBox ID="txtCustomerName" runat="server" 
                        Text='<%# Eval("CustomerName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtCustomerName" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProjectName">
            <EditItemTemplate>
                    <asp:TextBox ID="txtProjectName" runat="server" 
                        Text='<%# Eval("CustomerName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DeliveryManager">
            <EditItemTemplate>
                    <asp:TextBox ID="txtDeliveryManager" runat="server" 
                        Text='<%# Eval("DeliveryManager") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDeliveryManagere" runat="server" Text='<%# Eval("DeliveryManager") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AccountCategory">
            <EditItemTemplate>
                    <asp:TextBox ID="txtAccountCategory" runat="server" 
                        Text='<%# Eval("AccountCategory") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblAccountCategory" runat="server" Text='<%# Eval("AccountCategory") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IsActive">
            <EditItemTemplate>
                    <asp:TextBox ID="txtIsActive" runat="server" 
                        Text='<%# Eval("IsActive") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
         
        </Columns>
    </asp:GridView>
        <asp:GridView ID="GridViewImport" runat="server">
        </asp:GridView>
    <br />
    <br />
</div>
<div>
    <asp:FileUpload ID="fileuploademp" runat="server" />
</div>
    <asp:ImageButton ID="btnimport" runat="server" ImageUrl="~/Img/import.png" 
        onclick="btnimport_Click1" />
&nbsp;
    <asp:ImageButton ID="btnaddemp" runat="server" ImageUrl="~/Img/addemp.png" 
        Width="135px" onclick="btnaddemp_Click" />

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cfooter" Runat="Server">
</asp:Content>

