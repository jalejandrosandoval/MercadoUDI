<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterClient.Master" AutoEventWireup="true" CodeBehind="Config_Client.aspx.cs" Inherits="Parcial02_MercadoUDi.Config_Client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
        <h2 class="page-header">Information Personal...</h2>
    </div>

    <div class="divider"></div>

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                
                <div class="panel-heading">
                    <h2 class="panel-title"><i class="fa fa-edit fa-fw"></i> Update...</h2>
                </div>

                <div class="panel-body">

                    <form role="form" id="form_Update" runat="server">
                        <fieldset>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server">Username: &nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox class="form-control" ID="txt_Username" runat="server" PlaceHolder="Username" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server">Email: &nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox class="form-control" ID="txt_Email" runat="server" PlaceHolder="Email" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server">Password: &nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox class="form-control" ID="txt_Password" runat="server" PlaceHolder="Password" type="Password" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server">Confirm Password: &nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox class="form-control" ID="txt_ConfirmPassword" runat="server" PlaceHolder="Confirm Password" type="Password" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div>
                                <asp:CompareValidator ID="CompareValidator_Passwords" runat="server"
                                    ControlToCompare="txt_Password" ControlToValidate="txt_ConfirmPassword"
                                    ErrorMessage="(The Passwords Not Match)" ForeColor="Red"></asp:CompareValidator>
                            </div>

                            <br />

                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server">Number Card: &nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox class="form-control" ID="txt_UserCard" runat="server" PlaceHolder="Number Card" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <br />
                            <br />

                            <div class="col-md-12">

                                <div class="col-md-6">
                                    <asp:Button ID="Btn_Save" runat="server" Text="Update" class="btn btn-block btn btn-info" OnClick="Btn_Save_Click" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="Btn_Cancel" runat="server" Text="Cancel" class="btn btn-block btn btn-danger" OnClick="Btn_Cancel_Click" />
                                </div>

                            </div>

                            <br />

                        </fieldset>
                    </form>

                </div>
            </div>
        </div>

    </div>

</asp:Content>
