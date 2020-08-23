<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterClient.Master" AutoEventWireup="true" CodeBehind="MyPurchases.aspx.cs" Inherits="Parcial02_MercadoUDi.MyPurchases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
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

                                <asp:GridView ID="GridView_Invoices" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" DataKeyNames="IdInvoice" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView_Invoices_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                                        <asp:BoundField DataField="IdInvoice" HeaderText="Invoice Code" InsertVisible="False" ReadOnly="True" SortExpression="IdInvoice" />
                                        <asp:BoundField DataField="InvoiceDate" HeaderText="Date" SortExpression="InvoiceDate" />
                                        <asp:BoundField DataField="InvoiceTotal" HeaderText="Total" SortExpression="InvoiceTotal" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mercado_UDiConnectionString %>" SelectCommand="SELECT [IdInvoice], [InvoiceDate], [InvoiceTotal] FROM [Invoice] WHERE ([InvoiceUserId] = @InvoiceUserId) ORDER BY [InvoiceDate] DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="InvoiceUserId" SessionField="Id_User" Type="Int32" />
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
        </div>
    </div>

</asp:Content>
