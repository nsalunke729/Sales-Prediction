<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_customer.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <a href="add_customer.aspx" class="genric-btn link circle linkmargin">Add New Customer</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Sr.No</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                  <th scope="col">Age</th>
                <th scope="col">Gender</th>
                    <th scope="col">Occupation</th>
                  
                   <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
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
                                    <td><%=row["custage"]%></td>
                                      <td><%=row["custgender"]%></td>
                                    <td><%=row["custoccupation"]%></td>
                                    
                                     
                                    <td><a href="add_customer.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>
                                      <td><a href="deletecustomer.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

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
    	</div>


</asp:Content>

