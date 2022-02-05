<%@ Page Title="History" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="Royality_Travels.History" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body {
            background-image: url("Images/back.jpg");
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

        .Star
        {
            background-image: url(Images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(Images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(Images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    
   </style>
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container table-responsive">
    
        <br />
       <div class="text-center">
           <asp:Label ID="Label1" class="text-warning"  runat="server" Text="Label" Visible="False"  Font-Bold="True" Font-Size="XX-Large"></asp:Label>
       </div>
        <br />
         <div class="text-center" >
     <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
  Rate Trips
  </button>
    </div>
    <br />
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Rate your Trips</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <h6 class="text-dark">Select Your Trips from Drop Down Menu to Rate</h6>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
           <br />
            <h6 class="text-warning">Rate your trip</h6>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <ajaxToolkit:Rating ID="Rating1" runat="server"
              
                   CurrentRating="0"
                   StarCssClass="Star"
                   WaitingStarCssClass="Star"
                   FilledStarCssClass="FilledStar"
                   EmptyStarCssClass="WaitingStar" 
                  AutoPostBack="true" OnChanged="Rating1_Changed"
                
                >

            </ajaxToolkit:Rating>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="showHistory" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" class="table table-dark table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="tripID" HeaderText="tripID" SortExpression="tripID" />
                <asp:BoundField DataField="seats" HeaderText="seats" SortExpression="seats" />
                <asp:BoundField DataField="booking_date" HeaderText="booking_date" SortExpression="booking_date" />
                <asp:BoundField DataField="packageID" HeaderText="packageID" SortExpression="packageID" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            </Columns>
        </asp:GridView>
</div>
    <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
</asp:Content>
