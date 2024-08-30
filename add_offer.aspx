<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_offer.aspx.cs" Inherits="_Default" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/external_css.css" rel="stylesheet" />
    <link href="css/nice-select.css" rel="stylesheet" />


     <script type="text/javascript">
         var chkvalue = "";


         function showimg() {
             debugger;
             var showimage = document.querySelector('#<%=showimge.ClientID %>');
              var file = document.querySelector('#<%=fileuplogo.ClientID%>').files[0];

              var reader = new window.FileReader();

              reader.onload = function () {
                  showimage.src = reader.result;

              }
              if (file) {
                  //reader.readasdataurl(file);
                  reader.readAsDataURL(file);

              }
              else {
                  showimage.src = "";
              }
          }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
        <div class="container">
               <div class="form-select col-6 div_addprod" >
                 <div>
            
                 <asp:DropDownList ID="ddcategory" runat="server">
                 
								</asp:DropDownList>
                     
                     </div>
                   </div>
        <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtoffername" runat="server" placeholder="Offer Name" class="single-input"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtoffername" ErrorMessage="Fill Offer Name"></asp:RequiredFieldValidator>

						</div>
            <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtprice" runat="server" placeholder="Price" class="single-input"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtprice" ErrorMessage="Fill Price"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
   
            <asp:TextBox ID="txtofferprice" runat="server" placeholder="Offer Price" class="single-input"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtofferprice" ErrorMessage="Fill Offer Price"></asp:RequiredFieldValidator>

						</div>
             <div class="col-6 div_addprod">
              <asp:TextBox ID="txtoffdesc" runat="server" placeholder="Description" class="single-input"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtoffdesc" ErrorMessage="Fill Description"></asp:RequiredFieldValidator>
						</div>
             
           
             <div class="col-6 div_addprod">
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:TextBox ID="txtsdate" runat="server" placeholder="Start Date" class="single-input"></asp:TextBox>
                  <ajax:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtsdate"
                                    Format="dd/MM/yyyy">
                                </ajax:CalendarExtender>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsdate" ErrorMessage="Select Start Date"></asp:RequiredFieldValidator>

						</div>


               <div class="col-6 div_addprod">
                  
              <asp:TextBox ID="txtldate" runat="server" placeholder="Last Date" class="single-input"></asp:TextBox>
                  <ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtldate"
                                    Format="dd/MM/yyyy">
                                </ajax:CalendarExtender>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtldate" ErrorMessage="Select Last Date"></asp:RequiredFieldValidator>

						</div>

             <div class="col-6 div_addprod">
             
                <asp:Image ID="showimge" runat="server" Height="50" Width="100" />
                 
              <asp:FileUpload ID="fileuplogo" runat="server" onchange="showimg()" />
                                                 
		  </div>

   
            <div class="col-8 div_addprod">
                
                  <asp:Button ID="btnsubmit" runat="server" Text="Save" class="genric-btn success circle" OnClick="btnsubmit_Click"></asp:Button>
            </div>
           
    </div>
    </center>
</asp:Content>

