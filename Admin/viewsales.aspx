<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="viewsales.aspx.cs" Inherits="Admin_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
       
        <center>
        <div class="container">
      <div class="cart_inner">
      <asp:Chart ID="Chart1" runat="server"   
        BackGradientStyle="LeftRight" Height="350px" Palette="None"   
        PaletteCustomColors="192, 0, 0" Width="700px">  
        <Series>  
            <asp:Series Name="Series1">  
            </asp:Series>  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1" >  
            </asp:ChartArea>  
        </ChartAreas>  
        <BorderSkin BackColor="" PageColor="192, 64, 0" />  
    </asp:Chart> 
      </div>

    </div>
            </center>
    	
</asp:Content>

