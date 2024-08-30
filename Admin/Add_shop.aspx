<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Add_shop.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
        <div class="container">
        <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtshopname" runat="server" placeholder="Shop Name" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtshopname" ErrorMessage="Fill Shop Name"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtcontact" runat="server" placeholder="Contact No." class="single-input" MaxLength="10"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcontact" ErrorMessage="Fill Contact No." ></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcontact" ErrorMessage="Invalid Contact No." ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtemailid" runat="server" placeholder="Email ID" class="single-input"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemailid" ErrorMessage="Fill Email_ID"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailid" ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

						</div>
               <div class="col-6 div_addprod">
              <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpassword" ErrorMessage="Fill Password"></asp:RequiredFieldValidator>
						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtdescription" runat="server" placeholder="Description" class="single-input"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdescription" ErrorMessage="Fill Description"></asp:RequiredFieldValidator>
						</div>
           
          
            <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="Save" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
           
    </div>
    </center>
    

</asp:Content>

