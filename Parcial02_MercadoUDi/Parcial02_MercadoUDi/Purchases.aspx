<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="Parcial02_MercadoUDi.Purchases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
        <h2 class="page-header">Purchases...</h2>
    </div>

    <div class="divider"></div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">

                    <form role="form" id="form1" runat="server">
                        <fieldset>

                            <div class="col-md-12">

                                <asp:GridView ID="GridView_Invoices" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView_Invoices_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                                        <asp:BoundField DataField="IdInvoice" HeaderText="Invoice Number" SortExpression="IdInvoice" />
                                        <asp:BoundField DataField="InvoiceUserId" HeaderText="User Id" SortExpression="InvoiceUserId" />
                                        <asp:BoundField DataField="InvoiceDate" HeaderText="Date" SortExpression="InvoiceDate" />
                                        <asp:BoundField DataField="InvoiceTotal" HeaderText="Price Total" SortExpression="InvoiceTotal" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mercado_UDiConnectionString %>" SelectCommand="SELECT [IdInvoice], [InvoiceUserId], [InvoiceDate], [InvoiceTotal] FROM [Invoice] ORDER BY [InvoiceDate] DESC">
                                </asp:SqlDataSource>

                                <br />

                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
