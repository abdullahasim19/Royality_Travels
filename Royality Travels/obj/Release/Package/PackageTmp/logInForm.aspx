<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="logInForm.aspx.cs" Inherits="Royality_Travels.logInForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
   <%-- <form class="loginForm" action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
    <div class="userForm">
    <div class="formTitle">LOGIN NOW</div>
        <hr class="division0" />
        <div class="txtField">
            <asp:TextBox ID="txtUserName" placeholder=" User ID" runat="server" Width="390px"></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        Display="Dynamic" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>

            <br />
            <asp:TextBox ID="txtPassword" runat="server" placeholder=" Password" TextMode="Password" Width="390px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        Display="Dynamic" ErrorMessage="Password field can't be empty" ForeColor="Red"></asp:RequiredFieldValidator>            
        </div>

        <div class="loginChoice">
            Admin: &nbsp<asp:RadioButton ID="admin"   Groupname="input"  runat="server" group="loginChoice" TextAlign="Left"/>
            &nbsp User: &nbsp<asp:RadioButton ID="user"  Groupname="input"   runat="server" group="loginChoice" TextAlign="Left"/>                      
        </div>
        <br />
        <div class="button">
            <asp:Button ID="btnLogin" runat="server" Text="Log In"  OnClick="btnLogin_Click"/>
        </div>

        <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
            <hr class="division" />
                
            <div class="problemLogIn">
                <p> Don't have an account?
                <asp:HyperLink ID="HyperLink1" NavigateUrl="signupForm.aspx" runat="server">Sign up </asp:HyperLink>
                </p>
                <p> Forgot password? 
                <asp:HyperLink ID="hlForgotPassword" NavigateUrl="forgotPasswordForm.aspx" runat="server">Reset it! </asp:HyperLink>
                </p>
                    
            </div>
    </div>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </asp:Panel>
    <br />
    <br />
   <%-- </form>--%>
</div>
</asp:Content>
