<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Parcial02_MercadoUDi.Login" %>

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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

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

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Default_Categories.aspx"><i class="fa fa-home fa-fw"></i></a>
            </div>

        </nav>

    <div class="container">
        <div class="row">
            <form role="form" id="form_Login" runat="server">

                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
        
                        <div class="panel-heading">

                            <h1 align="center">MercadoUDi</h1>
                            <hr />

                            <div>
                                <h2 class="panel-title"><i class="glyphicon glyphicon-log-in"></i> Please, Start Session... </h2>
                            </div>

                        </div>

                        <div class="panel-body">
                            <fieldset>

                                <br />

                                <div>
                                    <asp:TextBox class="form-control" ID="txt_Username" runat="server" PlaceHolder="Username"></asp:TextBox>
                                </div>

                                <br />

                                <div>
                                    <asp:TextBox class="form-control" ID="txt_Password" runat="server" PlaceHolder="Password" type="Password"></asp:TextBox>
                                </div>

                                <br />
                                <br />

                                <div>
                                    <asp:Button ID="Btn_StartSession" runat="server" Text="Login" OnClick="Btn_StartSession_Click" class="btn btn-lg btn-primary btn-block" />
                                </div>

                            </fieldset>
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
