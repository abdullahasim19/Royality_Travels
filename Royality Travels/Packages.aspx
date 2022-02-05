<%@ Page Title="Packages" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="Royality_Travels.Packages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
          body {
    background-image: url("Images/plan.jpg");
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment:fixed;
}
    .img-jumbo
    {
      background-image: url("Images/road.jpg");
      background-size: 100%,100%;
      background-repeat: no-repeat;
      height:auto;
     
    }
   
  </style>
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <%-- <div class="container-fluid">--%>
    <div class="jumbotron jumbotron-fluid img-jumbo">
    <div class="container-fluid">
      <h1 class="text-center text-warning "style="font-weight:bold;" >What are Packages?</h1>
      <p class="text-center text-warning "style="font-weight:bold;">
          We are currently offering Three Types of Packages.<br/>
          Click on these buttons to find out.
      </p>
      <br/>
      <div class="row">
        <div class="col-md-4 col-lg-4 col-sm-12"style="left:150px">
          <button type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myPremium">
            Premium
          </button>
         </div> 
         <div class="col-md-4 col-lg-4 col-sm-12"style="left:150px">
          <button type="button" class="btn btn-lg btn-dark" data-toggle="modal" data-target="#myRegular">
            Regular
          </button>
           </div> 
           <div class="col-md-4 col-lg-4 col-sm-12"style="left:150px">
            <button type="button" class="btn btn-lg btn-success" data-toggle="modal" data-target="#myBasic">
            Basic
            </button>
             </div> 
     </div>
    </div>
</div>    
<%--</div>--%>




<!-- The Modal -->
<div class="modal fade" id="myPremium">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Premium</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
      Premium Package is best for a complete group of friends or for a family or for a trip. This Package
       is for more than 10 people going. It provides everything on a reasonable amount for a large group of 
       people. All premium services will be provided.
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>



<div class="modal fade" id="myRegular">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Regular Package</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        This package is best for 5 to 6 people going. All services will be provided and it is for
        those who like to travel once a month. 
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>



<div class="modal fade" id="myBasic">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Basic Package</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       This package is for one or two people. It is best for those who like to travel alone. 
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
    <div class="text-center" >
     <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
   Add Trips to Wishlist
  </button>
    </div>
    <br />
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add to Wishlist</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <h6 class="text-dark">Select Available Trips from Drop Down Menu then click Add</h6>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <asp:Button ID="Button1"  class="btn btn-sm btn-success" onclick="Button_Click" runat="server" Text="Add" />
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
<h1 class="text-warning text-center"style="font-weight:bold;" >Available Trips</h1> <br/><br/>
<div class="container table-responsive">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [Trips]"></asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server"  class="table table-light  table-bordered table-hover"   AutoGenerateColumns="False" DataKeyNames="tripID" DataSourceID="SqlDataSource1">
         <HeaderStyle CssClass="thead-dark" />
        <Columns>
            <asp:BoundField DataField="tripID" HeaderText="tripID" ReadOnly="True" SortExpression="tripID" />
            <asp:BoundField DataField="location_name" HeaderText="location_name" SortExpression="location_name" />
            <asp:BoundField DataField="totalSeats" HeaderText="totalSeats" SortExpression="totalSeats" />
            <asp:BoundField DataField="seatsAvailable" HeaderText="seatsAvailable" SortExpression="seatsAvailable" />
            <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
            <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
    </asp:GridView>
</div>
    <br /> <br /> <br />
    <div class="text-center">
   <a href="TourPlans.aspx" class="btn btn-danger btn-lg" role="button">Click Here to View Tour Plans</a>
       </div> 

     <br /> <br /> <br />
  
</asp:Content>
