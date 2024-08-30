<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manage_offer.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <div class="container">
        <a href="add_offer.aspx" class="genric-btn link circle linkmargin">Add New Offer</a>
        
        <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Offer Id.</th>
                  <th scope="col">Category</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                  <th scope="col">Offer Price</th>
                <th scope="col">Description</th>
                  <th scope="col">Start Date</th>
                    <th scope="col">To Date</th>
                <th scope="col">Image</th>
                  
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
                                    <td><%=row["offer_id"]%></td>
                                     <td><%=row["category"]%></td>
                                    <td><%=row["offname"]%></td>
                                     <td><%=row["price"]%></td>
                                    <td><%=row["offprice"]%></td>
                                    <td><%=row["offdescription"]%></td>
                                    <td><%=row["offstartdate"]%></td>
                                      <td><%=row["offlastdate"]%></td>
                                    <td><img alt="image" height='50px' width='50px' src='<%=row["image"] %>' /></td>
                                   
                                     
                                    <td><a href="add_offer.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success btn-sm">Edit</a></td>
                                      <td><a href="deleteoffer.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Delete</a></td>
                 

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

