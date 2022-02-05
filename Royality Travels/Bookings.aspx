<%@ Page Title="Bookings" Language="C#" MasterPageFile="~/Basic.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="Royality_Travels.Bookings" %>
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <br/>  
    
   
    
    <div class="card ">
    <article class="card-body mx-auto" style="width: 400px;">
      <h4 class="card-title mt-3 text-center">Trip Bookings</h4>
      <p class="text-center">Get started with your Trip Booking</p>
      
     
     
        <h6>Choose From Available Trips:</h6>
        <div class="form-group " >
            <asp:DropDownList ID="DropDownList1"  class="form-control"  runat="server" Width="340px" CssClass="text-dark">
            
            </asp:DropDownList>
          
        </div>
        <h6>Choose Your Package ID</h6>
        <h6 class="text-warning">1 means basic package 2 means regular package and 3 means premium package</h6>
        <h6 class="text-warning">Visit Packages Section for more details</h6>
        <div class="form-group " >
            <asp:DropDownList ID="DropDownList2"  class="form-control"  runat="server" Width="340px" CssClass="text-dark">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            </asp:DropDownList>
          
        </div>
          <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Available Seats"></asp:TextBox>
                              <asp:Button class=" btn btn-primary btn-sm" ID="Button4" runat="server" Text="Check Seats"   causesvalidation="False"    OnClick="Button4_Click"  />
                           </div>
                        </div>

     
       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>--%>
        

         <h6>Select Booking Date</h6>
         <div class="form-group input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fas fa-suitcase-rolling"></i> </span>
         </div>
            <asp:TextBox ID="TextBox7" Width="306px"  placeholder="Enter Booking Date"   runat="server" TextMode="Date"></asp:TextBox>
        </div> <!-- form-group// -->
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox7" ></asp:RequiredFieldValidator>
       <br />
       
        <div class="form-group input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fas fa-suitcase-rolling"></i> </span>
         </div>
            <asp:TextBox ID="TextBox2" Width="306px"  placeholder="Enter Total Seats"  runat="server"></asp:TextBox>
        </div> <!-- form-group// -->
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox2" ></asp:RequiredFieldValidator>

      
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox2" ></asp:RequiredFieldValidator>


         <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Calculate Price"></asp:TextBox>
                              <asp:Button class=" btn btn-primary btn-sm" ID="Button2" runat="server" Text="See Price" causesvalidation="False"  OnClick="Button2_Click"  />
                           </div>
                        </div>

        <asp:Label ID="Label2" runat="server"  class="text-danger" Text="Label" Visible="False"></asp:Label>
         <br />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox6" ></asp:RequiredFieldValidator>  
      
       

       <br />
        <div class="form-group input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
        </div>
            <asp:TextBox ID="TextBox3"  Width="306px"  placeholder="Enter your password to confirm booking" runat="server" TextMode="Password"></asp:TextBox>
        </div> <!-- form-group// -->
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  Display="Dynamic" ForeColor="Red" ErrorMessage="Required"  ControlToValidate="TextBox3" ></asp:RequiredFieldValidator>
        <br />                                       
        <div class="form-group">
            <asp:Button ID="Button1"  class="btn btn-danger btn-block"  runat="server" Text="Book Trip" OnClick="Button1_Click" />
        </div> <!-- form-group// -->      
                                                                  
       <asp:Label ID="Label1" runat="server"   Text="Label" Visible="False"></asp:Label>
    </article>
    </div> <!-- card.// -->
    
    </div> 
    <!--container end.//-->
    
    <br><br>
</asp:Content>
