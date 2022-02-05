<%@ Page Title="Tour Plans" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="TourPlans.aspx.cs" Inherits="Royality_Travels.TourPlans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="Css/Plans.css" rel="stylesheet" />
    <style>
         body {
    background-image: url("Images/plan.jpg");
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment:fixed;
}
         .setpic
         {
             height:200px;
             width:300px;
         }
          
       
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron-fluid">
    <div class="container">
      <h1 class="text-center">What are Tour Plans?</h1>
      <p class="text-center">
        A tour plan explains the schedule of a complete trip. For example you can 
        check the date of departure, date of arrival, duration of stay, places where to 
        stop. What to bring and not to bring. All these things are mentioned in tour plans.
        You can search for a tour plan of all the available trips.
        Click on the search button to search by trip ID.<br/><br/>
        Click the button below to see the available trips.
      </p>
      <div class="col-md-12 text-center">
      <a href="Packages.aspx" class="btn btn-dark  ">Availble Trips</a>
      </div>
   
    </div>
  </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [guides]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server"   class="table table-light  table-bordered table-hover"   AutoGenerateColumns="False" DataKeyNames="TripID" DataSourceID="SqlDataSource1">
             <HeaderStyle CssClass="thead-dark" />
            <Columns>
             
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="row">

                            <div class="col-md-4 col-lg-4 col-sm-12">
                                <asp:Image ID="Image1" class="img-fluid setpic" runat="server" ImageUrl='<%# Eval("piclocation") %>' />
                            
                            </div>

                            <div class="col-md-8 col-lg-8 col-sm-12">
                                <div class="row">

                                     <div class="col-md-12 col-lg-12 col-sm-12">
                                           <asp:Label ID="Label4" runat="server" Text="Trip ID" Font-Size="X-Large" Font-Bold="True"> </asp:Label>
                                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("TripID") %>' Font-Size="X-Large" Font-Bold="True" ></asp:Label>
                                     </div>
                                </div>

                                <div class="row">

                                     <div class="col-md-12 col-lg-12 col-sm-12">
                                       
                                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("location_name") %>' Font-Size="Large" Font-Bold="True"></asp:Label>
                                     </div>
                                </div>

                                <div class="row">

                                     <div class="col-md-12 col-lg-12 col-sm-12">
                                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("plan") %>'></asp:Label>
                                     </div>
                                </div>
                            </div>


                        </div>
                       
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                </div>
            </div>
    </div>



  <%--<div class="container" id="myItems">
    <div class="row">
      <div class="col-sm-12 mb-3">
       <div class="container h-100">
      <div class="d-flex justify-content-center h-100">
        <div class="searchbar">
          <input class="search_input " id="myFilter"type="text" name=""onkeyup="myFunction()" placeholder="Enter ID">
          <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
        </div>
      </div>
    </div>
      </div>
    </div>
    <div class="row" >
      <div class="col-md-4 col-lg-4 col-sm-12">
        <div class="card " >
          <img class=" img-fluid card-img-top" src="Images/hunza.jpg" alt="Card image">
          <div class="card-body">
            <h5 class="card-title">Trip ID 1</h5>
            <h6 class="card-subtitle mb-2 text-muted">Hunza Valley</h6>
            <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
              and duration of the trip will be 4 days. Food will be provided. 
              From Morning 8:00 till noon Tour guides will show you different places
              after that they will guide you to your hotel room. 
              Departure will be on 4th February at 12:00 pm.
            </p>
          </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-4 col-sm-12">
      <div class="card " >
        <img class=" img-fluid card-img-top" src="Images/Swat.jpg" alt="Card image">
        <div class="card-body">
          <h5 class="card-title">Trip ID 2</h5>
          <h6 class="card-subtitle mb-2 text-muted">Swat</h6>
          <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
            and duration of the trip will be 4 days. Food will be provided. 
            From Morning 8:00 till noon Tour guides will show you different places
            after that they will guide you to your hotel room. 
            Departure will be on 4th February at 12:00 pm.</p>
        </div>
      </div>
  </div>
  <div class="col-md-4 col-lg-4 col-sm-12">
    <div class="card " >
      <img class="card-img-top" src="Images/fairy.jpg" alt="Card image">
      <div class="card-body">
        <h5 class="card-title">Trip ID 3</h5>
        <h6 class="card-subtitle mb-2 text-muted">Fairy Meadows</h6>
        <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
          and duration of the trip will be 4 days. Food will be provided. 
          From Morning 8:00 till noon Tour guides will show you different places
          after that they will guide you to your hotel room. 
          Departure will be on 4th February at 12:00 pm.</p>
      </div>
    </div>
</div>
                      
    </div>
  <br/>
    <div class="row">
      <div class="col-md-4 col-lg-4 col-sm-12">
        <div class="card  " >
          <img class="card-img-top" src="Images/margala.jpg" alt="Card image">
          <div class="card-body">
            <h5 class="card-title">Trip ID 4</h5>
            <h6 class="card-subtitle mb-2 text-muted">Margala</h6>
            <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
              and duration of the trip will be 4 days. Food will be provided. 
              From Morning 8:00 till noon Tour guides will show you different places
              after that they will guide you to your hotel room. 
              Departure will be on 4th February at 12:00 pm.</p>
          </div>
        </div>
    </div>
    <div class="col-md-4 col-lg-4 col-sm-12">
      <div class="card " >
        <img class="card-img-top" src="Images/khunjerab.jpg" alt="Card image">
        <div class="card-body">
          <h5 class="card-title">Trip ID 5</h5>
          <h6 class="card-subtitle mb-2 text-muted">Khunjerab</h6>
          <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
            and duration of the trip will be 4 days. Food will be provided. 
            From Morning 8:00 till noon Tour guides will show you different places
            after that they will guide you to your hotel room. 
            Departure will be on 4th February at 12:00 pm.</p>
        </div>
      </div>
  </div>
  <div class="col-md-4 col-lg-4 col-sm-12">
    <div class="card " >
      <img class="card-img-top" src="Images/kalash.jpg" alt="Card image">
      <div class="card-body">
        <h5 class="card-title">Trip ID 6</h5>
        <h6 class="card-subtitle mb-2 text-muted">Kalash</h6>
        <p class="card-text">Trip Departure will be on 1st February at 10:00 AM
          and duration of the trip will be 4 days. Food will be provided. 
          From Morning 8:00 till noon Tour guides will show you different places
          after that they will guide you to your hotel room. 
          Departure will be on 4th February at 12:00 pm.</p>
      </div>
    </div>
</div>
          

    </div>
  <br/>
   
</div>--%>
          

  
 <%-- <script>

function myFunction() {
   
    var input=document.getElementById("myFilter").value.toUpperCase();
    var contains=document.getElementById("myItems");
    var cards=contains.getElementsByClassName("card");
    for(var i=0;i<cards.length;i++)
    {
        var title=cards[i].querySelector(".card-body h5.card-title");
        if(title.innerText.toUpperCase().indexOf(input)>-1)
        {
            cards[i].style.display = "";
        } 
        else 
        {
            cards[i].style.display = "none";
        }
    }
}
  </script>--%>
</asp:Content>
