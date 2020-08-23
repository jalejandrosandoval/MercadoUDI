<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="List_User.aspx.cs" Inherits="Parcial02_MercadoUDi.List_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
        <h2 class="page-header">List User...</h2>
    </div>

    <div class="divider"></div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <!-- /.panel-heading -->
                <div class="panel-body">

                    <form role="form" id="form1" runat="server">
                        <fieldset>

                            <div class="col-md-12">

                                <asp:GridView ID="GridView_Users" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" DataKeyNames="IdUser" DataSourceID="ObjectDataSource_Users">
                                    <Columns>
                                        <asp:BoundField DataField="IdUser" HeaderText="IdUser" InsertVisible="False" ReadOnly="True" SortExpression="IdUser" />
                                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                        <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                                        <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                                        <asp:BoundField DataField="UserStatus" HeaderText="UserStatus" SortExpression="UserStatus" />
                                        <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                    </Columns>
                                </asp:GridView>

                                <asp:ObjectDataSource ID="ObjectDataSource_Users" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.UserTableAdapter">                               
                                </asp:ObjectDataSource>

                                <br />

                            </div>
                            
                            

                            <div style="text-align: center" class="col-md-4 col-md-offset-4">
                                <asp:Button ID="Btn_Accept" runat="server" Text="Accept" class="btn btn-success btn-block" OnClick="Btn_Accept_Click"/>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
            <!-- /.panel -->
        </div>
    </div>

</asp:Content>
