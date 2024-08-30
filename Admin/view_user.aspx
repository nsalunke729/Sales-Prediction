<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="view_user.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">User id</th>
                <th scope="col">Name</th>
                <th scope="col">Email id</th>
                <th scope="col">Contact No.</th>
                <th scope="col">Address</th>
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["customer_id"]%></td>
                                    <td><%=row["custname"]%></td>
                                    <td><%=row["custemail"]%></td>
                                    <td><%=row["custcontact"]%></td>
                                    <td><%=row["custlocation"]%></td>

                                 </tr>
                            </tbody>
                           
                     <%  }
                      
                       
                   }%>
                   <%  else
                 {%>
                       Response.Write("<script>alert('No Data Found')</script>");
                   <%}%> 
           
          </table>
      
        </div>
      </div>
        </div>
  </section>

</asp:Content>

