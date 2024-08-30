<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MallEntry.aspx.cs" Inherits="MallEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <!--::header part start::-->
  <header class="main_menu home_menu">
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-11">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href=""> <img src="img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

<%--                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="Home.aspx">Home</a>
                                </li>
                           
                               
                                 <li class="nav-item">
                                    <a class="nav-link" href="manage_offer.aspx">Manage Offer</a>
                                </li>
                                
                                 <li class="nav-item">
                                    <a class="nav-link" href="view_user.aspx">View User</a>
                                </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="vendorlogin.aspx">Login</a>
                                </li>
                          
                            </ul>
                        </div>--%>
                        <div class="hearer_icon d-flex">
                            <div>
                           <a href="cart_details.aspx"><i class="ti-bag"></i></a>
                         </div>
                     
                        </div>
                    </nav>
                </div>
            </div>
        </div>
         </header>
    <!-- Header part end-->
        <center>
         <div class="container">
              <div class="col-6 div_addprod">
   
           

						</div>
        <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtmobile" runat="server" placeholder="Mobile Number" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmobile" ErrorMessage="Fill Mobile Number"></asp:RequiredFieldValidator>

						</div>
                <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="Predict" class="genric-btn success circle" OnClick="btnsubmit_Click" ></asp:Button>
            </div>
           
            
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Sr.No</th>
                <th scope="col">Offer Name</th>
                <th scope="col">Offer Price</th>
                <th scope="col">Start Date</th>
                  <th scope="col">Last Date</th>
                <th scope="col">Category</th>
                    <th scope="col">Shop Name</th>
                  
                  
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt1.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["Id"]%></td>
                                    <td><%=row["offer"]%></td>
                                    <td><%=row["price"]%></td>
                                    <td><%=row["start_date"]%></td>
                                    <td><%=row["last_date"]%></td>
                                      <td><%=row["category"]%></td>
                                    <td><%=row["shop_name"]%></td>
                                    
                                   
                                 </tr>
                            </tbody>
                           
                     <%  }
                      
                       
                   }%>
                   <%  else
                 {%>
                      <%-- Response.Write("<script>alert('No Data Found')</script>");--%>
                   <%}%> 
           
          </table>
      
        </div>
      </div>



             </div>
            </center>
    <!--::footer_part start::-->
    <footer class="footer_part">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-lg-2">
                    <%--<div class="single_footer_part">
                        <h4>Category</h4>
                        <ul class="list-unstyled">
                            <li><a href="productm.html">Male</a></li>
                            <li><a href="productf.html">Female</a></li>
                            <li><a href="soes.html">Shoes</a></li>
                        </ul>
                    </div>--%>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="single_footer_part">
                        <h4>Company</h4>
                        <ul class="list-unstyled">
                            <li><a href="">About</a></li>
                            <li><a href="">News</a></li>
                            <li><a href="">FAQ</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="single_footer_part">
                        <h4>Contact</h4>
                     <%--   <ul class="list-unstyled">
                            <li><a href="#">9892417997/9869315112</a></li>
                            <li><a>prabhusagar1305@gmail.com</a></li>
                        </ul>--%>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="single_footer_part">
                        <h4>Newsletter</h4>
                        <div id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="subscribe_form relative mail_part">
                                <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                    class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = ' Email Address '">
                                <button type="submit" name="submit" id="newsletter-submit"
                                    class="email_icon newsletter-submit button-contactForm">subscribe</button>
                                <div class="mt-10 info"></div>
                            </form>
                        </div>
                        <div class="social_icon">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            
    </footer>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/mixitup.min.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
    </div>
    </form>
</body>
</html>
