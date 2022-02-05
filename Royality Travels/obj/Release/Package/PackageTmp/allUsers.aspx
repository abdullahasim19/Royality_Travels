<%@ Page Title="User Details" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="allUsers.aspx.cs" Inherits="Royality_Travels.allUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="text-center">
        <h1 class="text-warning">All Users</h1>
        <br /><br />

    </div>
    <div class="container table-responsive">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="seeUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  class="table table-light  table-bordered table-hover"   DataKeyNames="userID" DataSourceID="SqlDataSource1">
              <HeaderStyle CssClass="thead-dark" />
            <Columns>
                <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="phoneNum" HeaderText="phoneNum" SortExpression="phoneNum" />
                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password"  HeaderText="Password" SortExpression="Password"   />
                
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
