<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Update_Category.aspx.cs" Inherits="Parcial02_MercadoUDi.Update_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
        <h2 class="page-header">Update Category</h2>
    </div>

    <div class="divider" /> 

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2 class="panel-title"><i class="fa fa-pencil-square-o fa-fw"></i> Update a Category...</h2>
                </div>

                <div class="panel-body">
                    <form role="form" id="form1" runat="server">
                        <fieldset>

                            <br />

                            <div>
                                <asp:TextBox ID="txt_CategoryName" runat="server" class="form-control"  PlaceHolder="Category Name"></asp:TextBox> 
                            </div>

                            <br />

                            <div>
                                <asp:Label runat="server"> Category Image: </asp:Label>
                                <br />
                                <div align="center">
                                    <asp:Image ID="Image_Category" runat="server" Width="250px" />
                                </div>
                                <br />
                                <asp:Label runat="server">Update Image: </asp:Label>
                                <br />
                                <asp:FileUpload ID="FileUpload_Image" runat="server" CssClass="input-file" PlaceHolder="Category Image"/>
                            </div>

                            <br />

                            <div>
                                <asp:TextBox ID="txt_CategoryDescription" runat="server" class="form-control" PlaceHolder="Category Description" TextMode="MultiLine" Style="width: 480px; height: 100px; min-height: 80px; min-width: 480px; max-width: 480px"></asp:TextBox>
                            </div>

                            <br />
                            
                            <div>
                                <asp:Label runat="server"> Category Status: </asp:Label>
                                <asp:DropDownList ID="DropDownList_Status" runat="server">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <br />

                            <div syle: align="center">
                                <asp:Button ID="Btn_Save" runat="server" Text="Save" class="btn btn-md btn btn-info" OnClick="Btn_Save_Click" />
                                <asp:Button ID="Btn_Cancel" runat="server" Text="Cancel" class="btn btn-md btn btn-danger" OnClick="Btn_Cancel_Click" />
                            </div>

                        </fieldset>
                    </form>
                </div>

            </div>
        </div>
    </div>

</asp:Content>

