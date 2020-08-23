<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_User_Login.aspx.cs" Inherits="Parcial02_MercadoUDi.Register_User_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>MercadoUDi</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
    
    <div class="container">
        <div class="row">
            <form role="form" id="form_Login" runat="server">

                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">

                        <div class="panel-heading">

                            <h1 align="center">MercadoUDi</h1>

                            <hr />

                            <div>
                                <h2 class="panel-title"><i class="glyphicon glyphicon-edit"></i> Please, Register!... </h2>
                            </div>

                        </div>

                        <div class="panel-body">
                            <fieldset>

                                <br />

                                <div>
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server">Username: &nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox class="form-control" ID="txt_Username" runat="server" PlaceHolder="Username" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>

                                    <br />

                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server">Email: &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox class="form-control" ID="txt_Email" runat="server" PlaceHolder="Email" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <br />

                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server">Password: &nbsp&nbsp;&nbsp;&nbsp; &nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox class="form-control" ID="txt_Password" runat="server" PlaceHolder="Password" type="Password" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <br />

                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server">Confirm Password: &nbsp;</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox class="form-control" ID="txt_ConfirmPassword" runat="server" PlaceHolder="Confirm Password" type="Password" Width="200px"></asp:TextBox>
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
                                                    <asp:TextBox class="form-control" ID="txt_UserCard" runat="server" PlaceHolder="Number Card" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <br />

                                    <div>
                                        <asp:Label class="form-group" ID="labelStatus" runat="server"> Status:&nbsp;&nbsp;</asp:Label>
                                        <asp:DropDownList class="form-group" ID="DropDownList_Status" runat="server">
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;&nbsp&nbsp;
                                                                <asp:Label class="form-group" ID="labelUserType" runat="server">User Type:</asp:Label>
                                        <asp:DropDownList class="form-group" ID="DropDownList_UserType" runat="server">
                                            <asp:ListItem>Administrator</asp:ListItem>
                                            <asp:ListItem>Client</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                    <br />
                                    <br />

                                    <div class="col-md-12">

                                        <div class="col-md-6">
                                            <asp:Button ID="Btn_Save" runat="server" Text="Register" class="btn btn-block btn btn-info" OnClick="Btn_Save_Click" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button ID="Btn_Cancel" runat="server" Text="Cancel" class="btn btn-block btn btn-danger" OnClick="Btn_Cancel_Click" />
                                        </div>
                                    </div>

                                </div>

                                <br />


                            </fieldset>
                        </div>
                    </div>
                </div>

                <div id="Footer_Panel_Login" class="col-md-4 col-md-offset-4">
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <asp:Button ID="Btn_Login" runat="server" Text="Sign In!" class="btn btn-md btn btn-link btn-block" OnClick="Sing_In_Click" />

                                        </div>
                                    </div>
                                </div>

                                <div id="Footer_Panel_Recover_Password" class="col-md-4 col-md-offset-4">
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <asp:Button ID="Recover_Password" runat="server" Text="Have you forgotten the Password?" class="btn btn-md btn btn-link btn-block" OnClick="Recover_Password_Click" />

                                        </div>
                                    </div>
                                </div>
            </form>
        </div>
    </div>


    <!--/form-->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


</body>
</html>
