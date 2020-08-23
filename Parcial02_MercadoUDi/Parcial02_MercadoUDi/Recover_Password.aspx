<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recover_Password.aspx.cs" Inherits="Parcial02_MercadoUDi.Recover_Password" %>

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
                                <h2 class="panel-title"><i class="glyphicon glyphicon-repeat"></i> Reset Password... </h2>
                            </div>

                        </div>

                        <br />

                        <div class="text-center mt-4 mb-5">
                            <h4>Forgot your password?</h4>
                            <br />
                            <p>Enter your email address and we will send you instructions on how to reset your password.</p>
                        </div>

                        <div class="panel-body">
                            <fieldset>
                                <br />

                                <div>
                                    <asp:TextBox class="form-control" ID="txt_Usermail" runat="server" PlaceHolder="Enter email address"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="REValidatorEmail" runat="server"
                                        ControlToValidate="txt_UserMail"
                                        ErrorMessage="(Only e-mail)"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>


                                <br />

                                <div>
                                    <asp:Button ID="Btn_RecoverPassword" runat="server" Text="Reset Password" class="btn btn-md btn-primary btn-block" OnClick="Btn_RecoverPassword_Click"/>
                                </div>

                            </fieldset>
                        </div>
                    </div>

                </div>

                <div id="Footer_Panel_Login" class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">

                        <div class="panel-body">
                            
                            <asp:Button ID="Btn_Login" runat="server" Text="Sign In!" class="btn btn-md btn btn-link btn-block" OnClick="Sing_In_Click"/> 
                           
                        </div>

                    </div>
                </div>

                <div id="Footer_Panel_Register" class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">

                        <div class="panel-body">
                           
                            <asp:Button ID="Btn_RegisterAccount" runat="server" Text="Register an Account" class="btn btn-md btn btn-link btn-block" OnClick="Register_An_Account_Click"  />

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
