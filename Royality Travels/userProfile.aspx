<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Royality_Travels.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <%--<form action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
    <div class="userForm">
    <div class="formTitle">User Profile</div>
    <hr class="division0" />
    <%--<div class="alert alert-danger">
        <strong>Incomplete information!</strong>
    </div>--%>
    <div class="txtField">
        <label for="txtUserID">User ID</label>
        <asp:TextBox ID="txtUserName" placeholder=" Your User ID" runat="server" ReadOnly="True" Width="390px"></asp:TextBox>
        <br />
        <label for="txtUserName">Name</label>
        <asp:TextBox ID="TextBox1" runat="server" Width="390px" placeholder="Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <label for="txtUserPhoneNo">Phone Number</label>
        <asp:TextBox ID="txtPhNo" placeholder=" Your Phone Number" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhNo"
                        Display="Dynamic" ErrorMessage="PhoneNo. is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <label for="txtUserCountry">Country</label>
        <asp:TextBox ID="txtCountry" placeholder=" Your Country" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCountry"
                        Display="Dynamic" ErrorMessage="Country is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <label for="txtUserEmail">Email</label>
        <asp:TextBox ID="txtEmail" placeholder=" Your Email" runat="server" Width="390px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <hr class="division" />

        <label for="txtUserOldPass">Current Password</label>
        <asp:TextBox ID="oldPasswordtxt" placeholder=" Old Password" runat="server" TextMode="Password" Width="390px"></asp:TextBox>
        <br />
        <label for="txtUserNewPass">New Password</label>
        <asp:TextBox ID="newPasswordtxt1" runat="server" placeholder=" New Password" TextMode="Password" Width="390px"></asp:TextBox>
        <br />
        <label for="txtUserNewPass">Again New Password</label>
        <asp:TextBox ID="newPasswordtxt2" runat="server" placeholder=" Re-Enter New Password" TextMode="Password" Width="390px"></asp:TextBox>
        <br /> 
        
    </div>
    
    <br />
    <div class="button">
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="userUpdate_Click" />
    </div>

    <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
    <hr class="division" />
               

    </div>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </asp:Panel>
    <br />
    <br />
   <%-- </form>--%>
</div>
</asp:Content>
