<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_shop.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <a href="add_shop.aspx" class="genric-btn link circle linkmargin">Add New Shop</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Shop No.</th>
                <th scope="col">Name</th>
                <th scope="col">Contact No.</th>
                <th scope="col">Email ID</th>
                  <th scope="col">Description</th>
                   
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
                                    <td><%=row["shop_id"]%></td>
                                    <td><%=row["name"]%></td>
                                    <td><%=row["contact"]%></td>
                                    <td><%=row["email"]%></td>
                                    <td><%=row["description"]%></td>
                                     
                                     
                                    <td><a href="add_shop.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>
                                      <td><a href="deleteshop.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

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

