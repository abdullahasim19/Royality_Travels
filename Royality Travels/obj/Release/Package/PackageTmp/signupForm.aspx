<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="signupForm.aspx.cs" Inherits="Royality_Travels.signupForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <%--<form action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
    <div class="signUpForm">
    <div class="formTitle">Create Account</div>
    <hr class="division0" />
    <%--<div class="alert alert-danger">
        <strong>Incomplete information!</strong>
    </div>--%>
    <div class="txtField">
        <asp:TextBox ID="txtUserName" placeholder=" User Integer ID" runat="server" Width="390px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="UserID required" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="fullname" placeholder=" Full Name" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Name Required"  ControlToValidate="fullname"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtPhNo" placeholder=" Phone Number" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Phone required"  ControlToValidate="txtPhNo"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtCountry" placeholder=" Country" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Country Required"  ControlToValidate="txtCountry"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtEmail" placeholder=" Email" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Email Required"  ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        
        <br />
        <asp:TextBox ID="txtPassword" runat="server" placeholder=" Password" TextMode="Password" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Password Required"  ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
    </div>
    
    <br />
    <div class="button">
        <asp:Button ID="Button1" runat="server"  onclick="BtnLogin_Click" Text="Sign Up" />
    </div>

    <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
    <hr class="division" />
    <div class="problemLogIn">
        <p>have an account?
        <asp:HyperLink ID="HyperLink1" NavigateUrl="LogInForm.aspx" runat="server">Log in </asp:HyperLink>
        </p>               
    </div>

       


    </div>
    </asp:Panel>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
   <%-- </form>--%>
</div>
</asp:Content>
