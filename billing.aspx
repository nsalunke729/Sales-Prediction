<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="billing.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/external_css.css" rel="stylesheet" />
    <link href="css/nice-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <center>
         <div class="container">
               <div class="form-select col-6 div_addprod" >
                 <div>
            
                 <asp:DropDownList ID="ddcustomer" runat="server"  AutoPostBack="true">
                 
								</asp:DropDownList>
                     
                     </div>
                   </div>
             <div class="form-select col-6 div_addprod">
                 <div>
            
                 <asp:DropDownList ID="ddcategory" runat="server"  OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" AutoPostBack="True">
                 
								</asp:DropDownList>
                     
                     </div>
                   </div>
                 <div class="form-select col-6 div_addprod">
                 <div>
            
                 <asp:DropDownList ID="ddproduct" runat="server"  AutoPostBack="true">
                 
								</asp:DropDownList>
                     
                     </div>
                   </div>

              <div class="col-6 div_addprod">
   
           
						</div>

               <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtamount" runat="server" placeholder="Amount" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtamount" ErrorMessage="Fill Amount"></asp:RequiredFieldValidator>

						</div>
               <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtqty" runat="server" placeholder="Quantity" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtqty" ErrorMessage="Fill Quantity"></asp:RequiredFieldValidator>

						</div>
        
                <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="genric-btn success circle" OnClick="btnsubmit_Click" ></asp:Button>
            </div>
           
             </div>
            </center>
</asp:Content>

