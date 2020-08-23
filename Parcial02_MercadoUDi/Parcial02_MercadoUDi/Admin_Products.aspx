<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Admin_Products.aspx.cs" Inherits="Parcial02_MercadoUDi.Admin_Products" %>

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
                    <asp:LinkButton ID="Btn_RegisterProducts" runat="server" class="btn btn-md btn btn-info"
                        OnClick="Btn_RegisterProducts_Click">
                        <span aria-hidden="true" class="fa fa-plus-circle">
                        </span>  
                        Add New Product
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div class="divider"></div>   

    <div class="col-md-12">
         <h5><span> <i class="fa fa-info-circle fa-fw" style="color:#337AB7"></i> For update a product in special you should select a Category...</span></h5>
        <br />
    </div> 

    <div class="col-md-12">

            <asp:ListView ID="ListView_Categories" runat="server" DataKeyNames="IdCategory" DataSourceID="ObjectDataSource_Categories" GroupItemCount="4">
                
                <EmptyDataTemplate>
                    <span> <i class="fa fa-info-circle fa-fw" style="color:#337AB7"></i> No se han devuelto datos.</span>
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

                    <div class="col-md-12">
                        <div id="itemPlaceholderContainer" runat="server" class="row">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </div>

                </GroupTemplate>

                <ItemTemplate>

                    <div runat="server" style="padding: 20px" class="col-md-3">

                        <h4>  <%# Eval("CategoryName") %> </h4> <br />

                        <br />

                        <asp:ImageButton runat="server" ImageUrl='<%# Eval("CategoryImage") %>' Height="150" 
                            PostBackUrl='<%# "Products_By_Category_Update.aspx?IdCat=" + Eval("IdCategory") %>' />

                        <br />

                    </div>

                </ItemTemplate>
                

            </asp:ListView>

            <asp:ObjectDataSource ID="ObjectDataSource_Categories" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.CategoryTableAdapter"></asp:ObjectDataSource>

        </div>

    </form>

</asp:Content>
