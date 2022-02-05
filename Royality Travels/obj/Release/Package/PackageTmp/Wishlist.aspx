<%@ Page Title="Wishlist" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Royality_Travels.Wishlistt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.checked {
  color: yellow;
}
        body {
    background-image: url("Images/back.jpg");
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment:fixed;
    }
   </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container table-responsive">
         <div class="text-center">
           <asp:Label ID="Label1" class="text-warning"  runat="server" Text="Label" Visible="False"  Font-Bold="True" Font-Size="XX-Large"></asp:Label>
       </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="showWishlist" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server"  class="table table-dark table-striped"   AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="tripID" HeaderText="tripID" SortExpression="tripID" />
                <asp:BoundField DataField="location_name" HeaderText="location_name" SortExpression="location_name" />
                <asp:BoundField DataField="seatsAvailable" HeaderText="seatsAvailable" SortExpression="seatsAvailable" />
                <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            </Columns>
        </asp:GridView>
    </div>
    <br />

    <br /><br /><br /><br /><br /><br />
</asp:Content>
