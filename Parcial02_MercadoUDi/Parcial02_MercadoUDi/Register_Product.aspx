<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Register_Product.aspx.cs" Inherits="Parcial02_MercadoUDi.Register_Product" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    
    <div class="col-lg-12">
        <h2 class="page-header">Register Product</h2>
    </div>

    <div class="divider" /> 

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title"><i class="fa fa-user-plus"></i> Add New Product...</h2>
                </div>

                <div class="panel-body">
                    <form role="form" id="form1" runat="server">
                        <fieldset>

                           <br />

                            <div>
                                <table>
                                    <tr>
                                        <td align="left"> <asp:Label runat="server">Product Name: &nbsp;&nbsp;</asp:Label> </td>
                                        <td align="left">  <asp:TextBox ID="txt_ProductName" runat="server" class="form-control" PlaceHolder="Product Name" Width="350px"></asp:TextBox> </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <asp:Label runat="server"> Product Image: </asp:Label>
                                <br />
                                <div align="center">
                                    <asp:Image ID="Image_Product" runat="server" Width="250px" />
                                </div>
                                <br />
                                <asp:FileUpload ID="FileUpload_Image" runat="server" CssClass="input-file"/>
                                <br />
                            </div>

                            <br />

                            <div>
                                <asp:Label runat="server">Category of Product: 
                                    <asp:DropDownList ID="DropDownList_CategoriesProducts" runat="server" DataSourceID="ObjectDataSource_CategoriesProducts" DataTextField="CategoryName" DataValueField="IdCategory">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource_CategoriesProducts" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.CategoryTableAdapter"></asp:ObjectDataSource>
                                </asp:Label>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td align="left"> <asp:Label runat="server">Product Stock: &nbsp;&nbsp;</asp:Label> </td>
                                        <td align="left"> <asp:TextBox ID="txt_ProductStock" runat="server" class="form-control" PlaceHolder="Product Stock" Width="350px"></asp:TextBox> </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td align="left"><asp:Label runat="server">Product Price: &nbsp;&nbsp; </asp:Label></td>
                                        <td align="left"><asp:TextBox ID="txt_ProductPrice" runat="server" class="form-control" PlaceHolder="Product Price" Width="350px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <asp:Label runat="server">Product Description: </asp:Label>
                                <br />
                                <br />
                                <CKEditor:CKEditorControl ID="CKEditor_ProductDescription" BasePath="/ckeditor/" runat="server" PlaceHolder="Product Description" Style="width: 480px; height: 100px; min-height: 80px; min-width: 480px; max-width: 480px">
                                </CKEditor:CKEditorControl>
                            </div>

                            <div syle: align="center">
                                <asp:Button ID="Btn_Save" runat="server" Text="Save" class="btn btn-md btn btn-info" OnClick="Btn_Save_Click" />
                                <asp:Button ID="Btn_Cancel" runat="server" Text="Cancel" class="btn btn-md btn btn-danger" OnClick="Btn_Cancel_Click"/>
                            </div>

                        </fieldset>
                    </form>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
