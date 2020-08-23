<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterDefault.Master" AutoEventWireup="true" CodeBehind="Default_Categories.aspx.cs" Inherits="Parcial02_MercadoUDi.Default_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form1" runat="server">

        <div class="col-md-12">

            <h2 class="page-header">Categories</h2>

        </div>

        <div class="divider"></div>   

        <div class="col-md-12" align="center">

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
                            PostBackUrl='<%# "Default_Products_By_Category.aspx?IdCat=" + Eval("IdCategory") %>' />

                        <br />

                    </div>

                </ItemTemplate>
                

            </asp:ListView>

            <asp:ObjectDataSource ID="ObjectDataSource_Categories" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.CategoryTableAdapter"></asp:ObjectDataSource>

        </div>
    </form>

</asp:Content>
