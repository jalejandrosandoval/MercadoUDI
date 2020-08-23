<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterClient.Master" AutoEventWireup="true" CodeBehind="MyPurchases_Details.aspx.cs" Inherits="Parcial02_MercadoUDi.MyPurchases_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-md-12">
        <h2 class="page-header">My Purchases...</h2>
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
                                        <asp:BoundField DataField="InvoiceDetailsId" HeaderText="InvoiceDetailsId" InsertVisible="False" ReadOnly="True" SortExpression="InvoiceDetailsId" />
                                        <asp:BoundField DataField="InvoiceId" HeaderText="InvoiceId" SortExpression="InvoiceId" />
                                        <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                                        <asp:BoundField DataField="InvoiceDetailsQuantity" HeaderText="InvoiceDetailsQuantity" SortExpression="InvoiceDetailsQuantity" />
                                        <asp:BoundField DataField="InvoiceDetailsPriceUnitary" HeaderText="InvoiceDetailsPriceUnitary" SortExpression="InvoiceDetailsPriceUnitary" />
                                    </Columns>
                                </asp:GridView>                                

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mercado_UDiConnectionString %>" SelectCommand="SELECT * FROM [InvoiceDetails] WHERE ([InvoiceId] = @InvoiceId)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="InvoiceId" SessionField="IdInvo" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <br />

                            </div>
                            
                            <div style="text-align: center" class="col-md-4 col-md-offset-4">
                                <asp:Button ID="Btn_Accept" runat="server" Text="Accept" class="btn btn-success btn-block" OnClick="Btn_Accept_Click"/>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
            <!-- /.panel -->
        </div>
    </div>



</asp:Content>
