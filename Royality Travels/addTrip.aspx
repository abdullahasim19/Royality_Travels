<%@ Page Title="Add Trip" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="addTrip.aspx.cs" Inherits="Royality_Travels.addTrip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12">
     <div class="container">
    <%--<form action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" >
    <div class="signUpForm">
    <div class="formTitle">Add Trip</div>
    <hr class="division0" />
    <%--<div class="alert alert-danger">
        <strong>Incomplete information!</strong>
    </div>--%>
    <div class="txtField">
        <asp:TextBox ID="tripid" placeholder=" Trip ID" runat="server" Width="390px"></asp:TextBox>
        <br />
        <asp:TextBox ID="location" placeholder=" Location Name" runat="server" Width="390px"></asp:TextBox>
        <br />
       <%-- <asp:TextBox ID="package" placeholder=" PackageID" runat="server" Width="390px"></asp:TextBox>
        <br />--%>
        <asp:TextBox ID="cost" placeholder=" Cost" runat="server" Width="390px"></asp:TextBox>
        <br />
        <asp:TextBox ID="seats" placeholder="Total Seats" Width="390px" runat="server"></asp:TextBox>
        <br />
       <h6 class="text-center">Enter Start Date</h6>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" Width="390px"></asp:TextBox>
        <br />
           <h6 class="text-center">Enter End Date</h6>
        <asp:TextBox ID="TextBox5" runat="server"  Width="390px" TextMode="Date"></asp:TextBox>
    </div>
    
    <br />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <div class="button">
        <asp:Button ID="btnLogin" runat="server" Text="Add Trip"  OnClick="btnLogin_Click"/>
    </div>

    <asp:Label ID="lblError" Visible="False" ForeColor="Red"   runat="server"></asp:Label>
    <hr class="division" />
                
   

    </div>
    </asp:Panel>
    <br />
    <br />
   <%-- </form>--%>
</div>
           </div>


        <div class="col-md-6 col-lg-6 col-sm-12">
     <div class="container">
    <%--<form action="/action_page.php" runat="server">--%>
        <br />
        <br />
        <br />
    <asp:Panel ID="Panel2" runat="server" >
    <div class="signUpForm">
    <div class="formTitle">Add Trip Plan</div>
    <hr class="division0" />
    <%--<div class="alert alert-danger">
        <strong>Incomplete information!</strong>
    </div>--%>
    <div class="txtField">
        <asp:TextBox ID="TextBox1" placeholder="Trip ID"  Width="390px"  runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" placeholder=" Write Plan" runat="server" Width="390px" Height="132px"></asp:TextBox>
        
        <br />
       
        </div>
    
    <br />
        <div class="button">
            <asp:Button ID="Button1" runat="server" Text="Add Plan" OnClick="Button1_Click" />
    </div>
    <asp:Label ID="Label3" Visible="False" ForeColor="Red" runat="server"></asp:Label>
    <hr class="division" />
                
   

    </div>
    </asp:Panel>
    <br />
    <br />
   <%-- </form>--%>
</div>
           </div>

</div>


</asp:Content>
