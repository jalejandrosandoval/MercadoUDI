<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Admin_Users.aspx.cs" Inherits="Parcial02_MercadoUDi.Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    
    <form id="form1" runat="server">

        <div class="col-lg-12">   
            <h2 class="page-header">Users</h2>
        </div>

        <div class="divider"></div>

        <div class="row">        
            
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="col-md-8 col-md-offset-3">

                <asp:ImageButton ID="ImageButton_Add_User" runat="server" ImageUrl="~/Icons/Add_User.ico" OnClick="ImageButton_Add_User_Click" />

                &nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton_Edit_User" runat="server" ImageUrl="~/Icons/Edit_User.ico" OnClick="ImageButton_Edit_User_Click" />

                &nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton_Remove_User" runat="server" ImageUrl="~/Icons/Remove_User.ico" OnClick="ImageButton_Remove_User_Click" />

                &nbsp;&nbsp;&nbsp;

                    <asp:ImageButton ID="ImageButton_List_User" runat="server" ImageUrl="~/Icons/List_User.ico" OnClick="ImageButton_List_User_Click" />

            </div>

        </div>

    </form>
    
</asp:Content>
