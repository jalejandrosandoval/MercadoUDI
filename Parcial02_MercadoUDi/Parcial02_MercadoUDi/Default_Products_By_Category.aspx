<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterDefault.Master" AutoEventWireup="true" CodeBehind="Default_Products_By_Category.aspx.cs" Inherits="Parcial02_MercadoUDi.Default_Products_By_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
     
     <form role="form" id="form1" runat="server">

        <div class="col-lg-12">
            <h2 class="page-header">Products</h2>
        </div>

        <div class="divider"></div>   

        <div class="col-md-12">

            <div>
                <a href="Default_Categories.aspx" class="btn btn-md btn btn-link"><i class="fa fa-arrow-left fa-fw"></i>Back</a>
            </div>

            <asp:ListView ID="ListView_Categories" runat="server" DataKeyNames="IdProduct" DataSourceID="ObjectDataSource_Categories" GroupItemCount="3">    
                <EmptyDataTemplate>
                    <span> <i class="fa fa-info-circle fa-fw" style="color:#337AB7"></i> These products are only available in the store, coming soon them you will find here...</span>
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

                    <div runat="server" style="padding: 20px" class="col-md-4" align="center">

                        <asp:ImageButton runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="200" 
                            PostBackUrl='<%# "Default_Products_Details.aspx?IdPro=" + Eval("IdProduct") %>' />

                        <asp:LinkButton ID="ProductInfo" runat="server" CssClass="btn btn-link"
                            PostBackUrl='<%# "Default_Products_Details.aspx?IdPro=" + Eval("IdProduct") %>' >

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