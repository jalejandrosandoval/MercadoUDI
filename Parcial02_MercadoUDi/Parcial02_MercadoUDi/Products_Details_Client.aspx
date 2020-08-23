<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterClient.Master" AutoEventWireup="true" CodeBehind="Products_Details_Client.aspx.cs" Inherits="Parcial02_MercadoUDi.Products_Details_Client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form1" runat="server">

        
        <div class="col-md-12">
            <table>
                <tr>
                    <td class="col-md-12"> <h2 class="page-header">Products</h2> </td>
                    <td class="col-md-2"> 
                        <button type="button" class="btn btn-md btn btn-success" data-toggle="modal" data-target="#myModal">
                            <span aria-hidden="true" class="fa fa-plus-circle"></span>  
                                Add to cart
                        </button>
                    </td>
                </tr>
            </table>
        </div>

        <div class="col-md-12">
            <div class="divider"></div>
        </div>

        <div class="col-md-11 col-md-offset-1">

            <asp:ListView ID="ListView_Products_Details" runat="server" DataKeyNames="IdProduct" DataSourceID="ObjectDataSource_Products">

                <EmptyDataTemplate>
                    <span><i class="fa fa-info-circle fa-fw" style="color: #337AB7"></i>This product haven't a descrption...</span>
                </EmptyDataTemplate>

                <LayoutTemplate>

                    <div class="col-md-12">
                        <div id="groupPlaceholderContainer" class="container-fluid" runat="server" border="0" style="">
                            <div id="groupPlaceholder" runat="server">
                            </div>
                        </div>
                    </div>

                </LayoutTemplate>

                <GroupTemplate>

                    <div id="itemPlaceholderContainer" runat="server" class="row">
                        <div id="itemPlaceholder" runat="server">
                        </div>
                    </div>

                </GroupTemplate>

                <ItemTemplate>

                    <div runat="server" class="col-md-12">
                        <span>
                            <h1>
                                <b>
                                    <%# Eval("ProductName") %>
                                </b>
                            </h1>
                        </span>
                    </div>
                    <div class="divider"></div>

                    <br />

                    <div class="col-md-12">

                        <div runat="server" class="col-md-5">
                            <asp:Image runat="server" Id="ProductImage" ImageUrl='<%# Eval("ProductImage") %>' Height="300px" />
                        </div>

                        <div runat="server" class="col-md-7">
                            <div>
                                <span style="color: #FF0000">
                                    <h1>$ <%# Eval("ProductPrice") %>
                                    </h1>
                                </span>
                            </div>
                            <br />
                           
                        </div>

                    </div>

                    <br />

                    <div class="col-md-12" runat="server">
                        <div>
                            <p>
                                <%# Eval("ProductDescription") %>
                            </p>
                        </div>
                    </div>

                </ItemTemplate>

            </asp:ListView>

            <asp:ObjectDataSource ID="ObjectDataSource_Products" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_IdProduct" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.ProductTableAdapter">

                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="Original_IdProduct" QueryStringField="IdPro" Type="Int32" />
                </SelectParameters>

            </asp:ObjectDataSource>


            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Shopping Cart</h4>
                        </div>

                        <br />
                       
                        <div class="modal-body">

                            <h4><i class="fa fa-check"></i>Product added to shopping cart correctly </h4>


                            <div>
                                <div class="col-md-12">
                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="IdProduct" DataSourceID="ObjectDataSource1" RepeatLayout="Flow">
                                        <ItemTemplate>
                                            <div>
                                                <br />
                                                <div class="col-md-4" align="center">
                                                    <asp:Image ID="ProductImageLabel" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="130px" />
                                                </div>
                                                <div class="col-md-4">
                                                    <h3>
                                                        <b>
                                                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                                                        </b>
                                                    </h3>
                                                </div>
                                                <div class="col-md-4">
                                                    <span style="color: #FF0000">
                                                        <h3>$
                                                        <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Eval("ProductPrice") %>' />
                                                        </h3>
                                                    </span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_IdProduct" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.ProductTableAdapter" UpdateMethod="Update">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="Original_IdProduct" QueryStringField="IdPro" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>

                                    <div>
                                        <br />
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server"> Quantity: &nbsp;&nbsp&nbsp;&nbsp</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_Quantity" runat="server" class="form-control" PlaceHolder="Product Quantity" Width="200px"></asp:TextBox></td>
                                            </tr>
                                        </table>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txt_Quantity"
                                            ErrorMessage="(Only numbers)"
                                            ForeColor="Red"
                                            ValidationExpression="^[0-9]*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <br />

                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="Btn_Add_Shopping_Product" runat="server" class="btn btn-info" Text="Accept"
                                OnClick="Btn_Add_Shopping_Product_Click">
                            </asp:LinkButton>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </form>

</asp:Content>
