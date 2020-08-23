<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterDefault.Master" AutoEventWireup="true" CodeBehind="ShoppingCartDefault.aspx.cs" Inherits="Parcial02_MercadoUDi.ShoppingCartDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form1" runat="server">

        <div class="col-md-12">
            <h2 class="page-header">Shopping Cart</h2>
        </div>

        <div class="col-md-12">
            <div class="divider"></div>
        </div>

        <div class="col-md-12">
            <div>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="IdProduct" DataSourceID="ObjectDataSource1" RepeatLayout="Flow">

                    <ItemTemplate>

                        <div class="col-md-12">

                            <div class="col-md-4">
                                <asp:Image ID="ProductImageLabel" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="150px"/>
                            </div>
                            <div class="col-md-4">
                                ProductName:
                                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                            </div>
                            <div class="col-md-4">
                                Price Unitary:
                        <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Eval("ProductPrice") %>' />
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_IdProduct" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.ProductTableAdapter" UpdateMethod="Update">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Original_IdProduct" QueryStringField="IdPro" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <br />

                <div class="col-md-3 col-md-offset-8" align="right">
                    <h4>
                        <span style="color: #FF0000">
                            <asp:Label runat="server" ID="label_Subtotal" />
                        </span>
                    </h4>
                </div>

                <br />

                <div class="col-md-12">

                    <asp:Label ID="label_Quantity" runat="server">Quantity
                        <asp:TextBox runat="server" ID="txt_Quantity" class="form-control" Width="400px" PlaceHolder="Product Quantity" />
                    </asp:Label>
                    
                    <br />
                    
                    <asp:Label ID="label1" runat="server">IdPro
                        <asp:TextBox runat="server" ID="txt_IdPro" class="form-control" Width="400px" PlaceHolder="Product ID" />
                    </asp:Label>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
