<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShowOrders.aspx.cs" Inherits="projectdemo.ShowOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="left">
        <tr>
            <td align="center">
                <h3>
                    Cuttent Order Details.....
                </h3>
            </td>
        </tr>
         <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </td>
             <td>
                  <table align="right">
        <tr>
            <td align="center">
                Personal details
            </td>
        </tr>
         <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server"></asp:GridView>
            </td>
        </tr>

    </table>
             </td>
        </tr>

    </table>
   
</asp:Content>
