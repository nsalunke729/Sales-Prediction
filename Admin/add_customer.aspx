<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="add_customer.aspx.cs" Inherits="Admin_Default" %>


<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/external_css.css" rel="stylesheet" />
    <link href="css/nice-select.css" rel="stylesheet" />
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <div class="container">
        <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtname" runat="server" placeholder="Customer Name" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Fill Customer Name"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtmobile" runat="server" placeholder="Mobile No." class="single-input"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmobile" ErrorMessage="Fill Mobile No."></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtemail" runat="server" placeholder="Email Id" class="single-input"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Fill Email"></asp:RequiredFieldValidator>
						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtage" runat="server" placeholder="Age" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtage" ErrorMessage="Fill Age"></asp:RequiredFieldValidator>
						</div>
           <%--  <div class="col-6 div_addprod">
              <asp:TextBox ID="txtairportname" runat="server" placeholder="Airport" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtairportname" ErrorMessage="Fill Airport Name"></asp:RequiredFieldValidator>
						</div>--%>
            <%-- <div class="col-6 div_addprod">
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:TextBox ID="txtdate" runat="server" placeholder="Date" class="single-input"></asp:TextBox>
                  <ajax:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdate"
                                    Format="dd/MM/yyyy">
                                </ajax:CalendarExtender>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtdate" ErrorMessage="Fill Select Date"></asp:RequiredFieldValidator>

						</div>--%>

             <div class="form-select col-6 div_addprod" >
                 <div>
            
                 <asp:DropDownList ID="ddgender" runat="server">
                  <asp:ListItem Value="1" Text="Male"></asp:ListItem>
                      <asp:ListItem Value="2" Text="Female"></asp:ListItem>   
								</asp:DropDownList>
                     
                     </div>
		  </div>

             <div class="form-select col-6 div_addprod" >
                 <div>
            
                 <asp:DropDownList ID="ddoccupation" runat="server">
                  <asp:ListItem Value="1" Text="Student"></asp:ListItem>
                      <asp:ListItem Value="2" Text="Work"></asp:ListItem>   
								</asp:DropDownList>
                     
                     </div>
		  
		  </div>
   
            <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="Save" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
           
    </div>
    
    
</asp:Content>

