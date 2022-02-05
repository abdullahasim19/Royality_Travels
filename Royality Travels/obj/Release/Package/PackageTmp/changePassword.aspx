<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="Royality_Travels.changePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
   <%-- <form class="changePassword" action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
                
        <div class="changePasswordForm">
        <div class="formTitle">Update Password</div>
            <hr class="division0" />

            <div class="txtField">
                <asp:TextBox ID="oldPasswordtxt" placeholder=" Old Password" runat="server" TextMode="Password" Width="390px"></asp:TextBox>
                <br />
                <asp:TextBox ID="newPasswordtxt1" runat="server" placeholder=" New Password" TextMode="Password" Width="390px"></asp:TextBox>
                <br />
                <asp:TextBox ID="newPasswordtxt2" runat="server" placeholder=" Re-Enter New Password" TextMode="Password" Width="390px"></asp:TextBox>
                <br /> 
            </div>

            <div class="button">
                <asp:Button ID="btnLogin" runat="server" Text="Update" PostBackUrl="HomePage.aspx"/>
                <br />
            </div>
                
          <%--  <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>--%>
                    
        </div>
              
    </asp:Panel>
    <br />
    <br />
<%--    </form>--%>
</div>
</asp:Content>
