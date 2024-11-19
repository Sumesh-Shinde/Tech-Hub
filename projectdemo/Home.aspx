<%@ Page Title="" Language="C#" MasterPageFile="~/SiteHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="projectdemo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- about section start -->
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  <div class="about_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="image_2"><img src="images/pngtree-computer-store-with-many-computers-and-displays-picture-image_2759015.png"></div>
        </div>
        <div class="col-md-6">
          <h1 class="about_text">ABOUT</h1>
          <p class="lorem_text">Visit your local computer shop for expert advice, quality products, and reliable tech support. Whether you need a new laptop, PC repairs, or accessories, we've got you covered. Supporting your digital needs right in your neighborhood</p>
         
        </div>
      </div>
    </div>
  </div>
  <!-- about section end -->
</asp:Content>
