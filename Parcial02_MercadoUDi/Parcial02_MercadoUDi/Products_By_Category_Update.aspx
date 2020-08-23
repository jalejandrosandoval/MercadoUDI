<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Products_By_Category_Update.aspx.cs" Inherits="Parcial02_MercadoUDi.Products_By_Category_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form2" runat="server">

        <div class="col-md-12">
            <table>
                <tr>
                    <td class="col-md-12">
                        <h2 class="page-header">Products</h2>
                    </td>
                    <td class="col-md-4">
                        <asp:LinkButton ID="Btn_RegisterProducts" runat="server" class="btn btn-md btn btn-info">
                        <span aria-hidden="true" class="fa fa-plus-circle">
                        </span>  
                        Add New Product
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>

        <div class="divider"></div>

        <div class="col-md-12"">    
                <asp:Label runat="server" id="LabelInfo2" Text="For update a product in special you should select some product of these...">
                <h5><span><i class="fa fa-info-circle fa-fw" style="color: #337AB7"></i> </span></h5>
                    </asp:Label>
            <br />
        </div>

        <div class="col-md-12">
            <asp:Label runat="server" id="LabelInfo" Text="For update a product in special you should select a Category...">
                <h5><span><i class="fa fa-info-circle fa-fw" style="color: #337AB7"></i> </span></h5>
            </asp:Label>
                <br />
        </div>

        <div class="col-md-12">

            <asp:ListView ID="ListView_Products_By_Categories" runat="server" DataKeyNames="IdProduct" DataSourceID="ObjectDataSource_Categories" GroupItemCount="3">

                <EmptyDataTemplate>
                    <span><i class="fa fa-info-circle fa-fw" style="color: #337AB7"></i>These products are only available in the store, coming soon them you will find here...</span>
                </EmptyDataTemplate>

                <LayoutTemplate>
                    <div class="col-md-12">
                        <div id="groupPlaceholderContainer" class="container-fluid" runat="server">
                            <div id="groupPlaceholder" runat="server">
                            </div>
                        </div>
                    </div>
                </LayoutTemplate>

                <GroupTemplate>

                    <div id="itemPlaceholderContainer" runat="server">
                        <div id="itemPlaceholder" runat="server">
                        </div>
                    </div>

                </GroupTemplate>

                <ItemTemplate>

                    <div runat="server" style="padding: 20px" class="col-md-4">

                        <asp:ImageButton runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="200"
                            PostBackUrl='<%# "Update_Products.aspx?IdPro=" + Eval("IdProduct") %>' />

                        <asp:LinkButton ID="ProductInfo" runat="server" CssClass="btn btn-link"
                            PostBackUrl='<%# "Update_Products.aspx?IdPro=" + Eval("IdProduct") %>'>

                        <div align="left">
                            <div>
                                <h3><%# Eval("ProductName") %> </h3>
                            </div>

                            <div>
                                <h4 style="color: #FF0000">$ <%# Eval("ProductPrice") %> </h4>
                            </div>
                        </div>

                        </asp:LinkButton>

                        <br />

                    </div>

                </ItemTemplate>


            </asp:ListView>

            <asp:ObjectDataSource ID="ObjectDataSource_Categories" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Product_By_Category" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.ProductTableAdapter">

                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="Category" QueryStringField="IdCat" Type="Int32" />
                </SelectParameters>

            </asp:ObjectDataSource>

        </div>

    </form>

</asp:Content>
