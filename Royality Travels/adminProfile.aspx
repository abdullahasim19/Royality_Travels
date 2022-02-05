<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="adminProfile.aspx.cs" Inherits="Royality_Travels.adminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
  <%--  <form action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
    <div class="userForm">
    <div class="formTitle">Admin Profile</div>
    <hr class="division0" />
    <%--<div class="alert alert-danger">
        <strong>Incomplete information!</strong>
    </div>--%>
    <div class="txtField">
        <label for="txtUserName">AdminID:</label>
        <asp:TextBox ID="txtUserName" placeholder=" Your Admin ID" runat="server" Width="390px"></asp:TextBox>
        <br />
        <label for="fullname">Full Name:</label>
        <asp:TextBox ID="fullname" runat="server" placeholder="Full Name" Width="390px"></asp:TextBox>
        <br />
        <label for="txtPhNo">Phone Number:</label>
        <asp:TextBox ID="txtPhNo" placeholder=" Your Phone Number" runat="server" Width="390px"></asp:TextBox>
        <br />
        <label for="txtCountry">Country:</label>
        <asp:TextBox ID="txtCountry" placeholder=" Your Country" runat="server" Width="390px"></asp:TextBox>
        <br />
        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" placeholder=" Your Email" runat="server" Width="390px"></asp:TextBox>
        
    </div>
    
    <br />
    <div class="button">
        <asp:Button ID="btnLogin" runat="server" Text="Update"  OnClick="btnLogin_Click"/>
    </div>

    <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
    <hr class="division" />
                
   

    </div>
    </asp:Panel>
    <br />
    <br />
  <%--  </form>--%>
</div>
</asp:Content>
