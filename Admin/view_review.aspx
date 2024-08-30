<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="view_review.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="css/nice-select.css" rel="stylesheet" />
    <link href="css/external_css.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <%--     <section class="cart_area section_padding">--%>
    <center>
    <div class="container">
     
        <%--<div class="table-responsive">--%>
       <%--   <table class="table">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">User Name</th>
                <th scope="col">Product Name</th>
                   <th scope="col">Review</th>
              
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["rev_id"]%></td>
                                    <td><%=row["username"]%></td>
                                    <td><%=row["name"]%></td>
                                    <td><%=row["sentiment_result"]%></td>
                                   

                                 </tr>
                            </tbody>
                           
                     <%  }
                      
                       
                   }%>
                   <%  else
                 {%>
                       Response.Write("<script>alert('No Data Found')</script>");
                   <%}%> 
           
          </table>--%>
            
<%--            				</div>--%>
         <asp:Label ID="lblproduct" runat="server" Text="Select Product"></asp:Label>
             <div class="form-select col-6 div_addprod" id="default-select">
                  
								<asp:DropDownList ID="ddproduct" runat="server" OnSelectedIndexChanged="ddproduct_SelectedIndexChanged" AutoPostBack="True">
								    
								</asp:DropDownList>

							</div>

        <div class="form-select col-6 div_addprod chart">
             <asp:Chart ID="Chart1" runat="server" Width="1000px">
                        <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1"></asp:Series>
                           
            </Series>
                       <ChartAreas>
                           <asp:ChartArea Name="ChartArea1" ></asp:ChartArea>

                       </ChartAreas>
                   </asp:Chart>
                   </div>

                    
               
        </div>
     
       
     
       </center>
  <%--</section>--%>
</asp:Content>

