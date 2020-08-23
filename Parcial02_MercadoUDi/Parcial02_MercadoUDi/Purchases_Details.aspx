<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Purchases_Details.aspx.cs" Inherits="Parcial02_MercadoUDi.Purchases_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-md-12">
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

                                <asp:GridView ID="GridView_Invoices" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="InvoiceDetailsId" HeaderText="Invoice Details Code" InsertVisible="False" ReadOnly="True" SortExpression="InvoiceDetailsId" />
                                        <asp:BoundField DataField="ProductId" HeaderText="Product Id" SortExpression="ProductId" />
                                        <asp:BoundField DataField="InvoiceDetailsQuantity" HeaderText="Quantity" SortExpression="InvoiceDetailsQuantity" />
                                        <asp:BoundField DataField="InvoiceDetailsPriceUnitary" HeaderText="Product Price Unitary" SortExpression="InvoiceDetailsPriceUnitary" />
                                    </Columns>
                                </asp:GridView>                                

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mercado_UDiConnectionString %>" SelectCommand="SELECT * FROM [InvoiceDetails] WHERE ([InvoiceId] = @InvoiceId)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="InvoiceId" SessionField="IdInvoAdmin" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <br />

                            </div>

                            <div>
                                <div class="col-md-3 col-md-offset-9">
                                    <h4>
                                        <b>
                                            <asp:Label ID="label9" runat="server" Text="Total:  $" />
                                        </b>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span style="color: #FF0000">
                                            <asp:Label ID="labelTotal" runat="server" />
                                        </span>
                                    </h4>
                                </div>

                                <br />
                                <br />
                                <br />
                                <br />

                            </div>

                            <br />
                            <br />
                            <br />
                            <br />
                            
                            <div style="text-align: center" class="col-md-4 col-md-offset-4">
                                <asp:Button ID="Btn_Accept" runat="server" Text="Accept" class="btn btn-success btn-block" OnClick="Btn_Accept_Click"/>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
