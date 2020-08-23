<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="List_Products.aspx.cs" Inherits="Parcial02_MercadoUDi.List_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    
    <form role="form" id="form1" runat="server">

        <div class="col-lg-12">

            <h2 class="page-header">Products</h2>

        </div>

        <div class="divider"></div>   

        <div class="col-md-12">

            <asp:ListView ID="ListView_Products" runat="server" DataKeyNames="IdProduct" DataSourceID="ObjectDataSource_Products" GroupItemCount="3">
                
                <EmptyDataTemplate>
                    <span> <i class="fa fa-info-circle fa-fw" style="color:#337AB7"></i> No se han devuelto datos.</span>
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
                            PostBackUrl='<%# "Products_Details.aspx?IdPro=" + Eval("IdProduct") %>' />

                        <asp:LinkButton ID="ProductInfo" runat="server" CssClass="btn btn-link"
                            PostBackUrl='<%# "Products_Details.aspx?IdPro=" + Eval("IdProduct") %>' >

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

            <asp:ObjectDataSource ID="ObjectDataSource_Products" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.ProductTableAdapter" >
                                
            </asp:ObjectDataSource>

        </div>
    </form>

</asp:Content>
