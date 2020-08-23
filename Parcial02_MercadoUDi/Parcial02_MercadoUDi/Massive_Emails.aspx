<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Massive_Emails.aspx.cs" Inherits="Parcial02_MercadoUDi.Massive_Emails" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form1" runat="server">

        <div class="col-md-12">
            <h2 class="page-header">Massive Emails</h2>
        </div>

        <div class="col-md-12">
            <div class="divider"></div>
        </div>

        <div>

            <div class="col-md-8 col-md-offset-2">

                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h2 class="panel-title"><i class="fa fa-send fa-fw"></i>Send Emails Massive to Users...</h2>
                    </div>

                    <div class="panel-body">
                        <fieldset>

                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td align="left">
                                            <asp:Label runat="server"> Email To: &nbsp;&nbsp;</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:ListBox ID="ListBox_EmailTo" runat="server" DataSourceID="ObjectDataSource1" SelectionMode="multiple" DataTextField="UserEmail" DataValueField="IdUser" Width="300px"></asp:ListBox>
                                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.UserTableAdapter"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td align="left">
                                            <asp:Label runat="server"> Subject: &nbsp;&nbsp;&nbsp;</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txt_Subject" runat="server" class="form-control" PlaceHolder="Subject" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <asp:Label runat="server">Message: </asp:Label>
                                <br />
                                <br />
                                <CKEditor:CKEditorControl ID="CKEditor_Message" BasePath="/ckeditor/" runat="server" PlaceHolder="Product Description" Style="width: 480px; height: 100px; min-height: 80px; min-width: 480px; max-width: 480px"></CKEditor:CKEditorControl>

                                <br />
                            </div>

                            <br />
                            <div style: align="center" class="col-md-4 col-md-offset-4">
                                <asp:Button ID="btn_SendEmail" runat="server" class="btn btn-block btn btn-info" Text="Send" OnClick="btn_SendEmail_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

