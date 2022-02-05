<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="forgotPasswordForm.aspx.cs" Inherits="Royality_Travels.forgetPasswordForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
   <%-- <form class="forgotPassword" action="/action_page.php" runat="server">--%>
    <br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" >
                
            <div class="forgotPasswordForm">
            <div class="formTitle">Reset Password</div>
                <hr class="division0" />

                <div class="txtField">  
                    Enter the ID and email address associated with your account, and we’ll email you a new password.
                   <br />
                    <br />
                    <asp:TextBox ID="userID" placeholder=" User ID" runat="server" Width="320px" ></asp:TextBox>
                    <br />
                    <asp:TextBox ID="emailtxt" placeholder=" Email" runat="server" Width="320px" ></asp:TextBox>
                    
                   
                </div>

                <div class="button">
                    <asp:Button ID="btnLogin" runat="server" Text="Enter" OnClick="resetBtn_Click" />
                </div>
                <br />
                <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
                    
             </div>
              
        </asp:Panel>
      
        <br />
 <%-- </form>--%>
</div>
    <br />
</asp:Content>
