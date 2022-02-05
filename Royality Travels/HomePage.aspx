<%@ Page Title="HomePage" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Royality_Travels.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="Css/HomePage.css">
    <style>
        body {
    background-image: url("Images/main.jpg");
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
         .setpic2
         {
             height:300px;
             width:700px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div>
        <div id="demo" class="carousel slide " data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow --> 
            <div class="carousel-inner">
              <div class="carousel-item active ">
                <img class="img-fluid"src="Images/carasol1.jpg" alt="Los Angeles">
                <div class="carousel-caption">
                  <h3>Welcome to Royality Travels</h3>
                  
                </div>
              </div>
              <div class="carousel-item">
                <img  class="img-fluid"src="Images/carasol2.jpg" alt="Chicago">
                <div class="carousel-caption">
                  <h3>Take some time off and travel</h3>
                </div>
              </div>
              <div class="carousel-item">
                <img class="img-fluid"src="Images/carasol3.jpg" alt="New York">
                <div class="carousel-caption">
                  <h3>We will provide you with best services</h3>
                </div>
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          
          </div>
        </div>
          <br><br>



    <div class="container">

      <div class="jumbotron " style="background-color: lightgray;">
        <div class="container">
          <h1 class="text-center">Who are we?</h1>
          <p >We aim to become trend-setters in Pakistan. 
            We give people opportunities to travel to some of the unexplored places in Pakistan alongside
             usual sight-seeing trips. We have conducted dozens of successful events since and
              inspired hundreds of people. So what are you waiting for? Select your type of 
              adventure and get on-board! Bon Voyage!
          </p>
          <a href="signupForm.aspx" class="btn btn-dark "data-toggle="tooltip" title="Click here to Create Account!"
           role="button">Get Started!</a>
         
        </div>
    </div>    
    </div>


        <!-- Posts section -->
<div class="blog"> <!--Popular Places-->
  <div class="container">
      <div class="text-center">
      <h1 class="text-warning">Trending Places</h1>
       </div>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT * FROM [Trending]"></asp:SqlDataSource>
      <asp:GridView ID="GridView1" runat="server"  class="table table-light  table-bordered table-hover"  AutoGenerateColumns="False" DataKeyNames="locationname" DataSourceID="SqlDataSource1">
           <HeaderStyle CssClass="thead-dark" />
           
          <Columns>
              
              <asp:TemplateField>
                  <ItemTemplate>
                     <div class="row">

                          <div class="col-md-4 col-lg-4 col-sm-12">
                            
                              <asp:Image ID="Image1" class="img-fluid setpic"  runat="server" ImageUrl='<%# Eval("piclocation") %>' />
                          </div>

                         <div class="col-md-8 col-lg-8 col-sm-12">
                             <div class="row">

                                 <div class="col-md-12 col-lg-12 col-sm-12">

                                     <asp:Label ID="Label1" runat="server" class="text-danger" Text='<%# Eval("locationname") %>' Font-Bold="True" Font-Size="Large"></asp:Label>


                                 </div>
                                 <div class="row">

                                     <div class="col-md-12 col-lg-12 col-sm-12">
                                         <asp:Label ID="Label2" runat="server" class="text-warning" Text='<%# Eval("description") %>' Font-Italic="True"></asp:Label>
                                
                                     </div>

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

 
<br/>


   <div class="container">

    <div class="team">
      <div class="container">
         <h1 class="text-center">Our Team</h1>
       <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 item">
         <img  class="setpic2 img-fluid" src="Images/arslan.jpeg"  alt="team">
         <div class="des">
           Arslan
          </div>
         <span class="text-dark">Student</span>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 item">
         <img  class="setpic2 img-fluid"  src="Images/Hammad.jpg"  alt="team">
         <div class="des">
            Hammad
          </div>
         <span class="text-dark">Student</span>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 item">
         <img  class="setpic2 img-fluid" src="Images/Abdullah.jpg"  alt="team">
         <div class="des">
           Abdullah
          </div>
         <span class="text-dark">Student</span>
        </div>
       </div>
      </div>
     </div>
   </div>

    <script>
      $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
      });    
    </script>
</asp:Content>
