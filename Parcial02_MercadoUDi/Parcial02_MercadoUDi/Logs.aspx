<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="Parcial02_MercadoUDi.Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="col-lg-12">
        <h2 class="page-header">Logs</h2>
    </div>

    <div class="divider"></div>

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <!-- /.panel-heading -->
                <div class="panel-body">

                    <form role="form" id="form1" runat="server">
                        <fieldset>

                            <asp:GridView ID="GridView_Logs" runat="server" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="ObjectDataSource_Logs" DataKeyNames="IdLog">
                                <Columns>
                                    <asp:BoundField DataField="IdLog" HeaderText="IdLog" InsertVisible="False" ReadOnly="True" SortExpression="IdLog" />
                                    <asp:BoundField DataField="LogType" HeaderText="LogType" SortExpression="LogType" />
                                    <asp:BoundField DataField="LogEvent" HeaderText="LogEvent" SortExpression="LogEvent" />
                                    <asp:BoundField DataField="LogDatetime" HeaderText="LogDatetime" SortExpression="LogDatetime" />
                                </Columns>
                            </asp:GridView>

                            <asp:ObjectDataSource ID="ObjectDataSource_Logs" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Parcial02_MercadoUDi.MercadoUDi_DataSetTableAdapters.LogTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_IdLog" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="LogType" Type="String" />
                                    <asp:Parameter Name="LogEvent" Type="String" />
                                    <asp:Parameter Name="LogDatetime" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="LogType" Type="String" />
                                    <asp:Parameter Name="LogEvent" Type="String" />
                                    <asp:Parameter Name="LogDatetime" Type="DateTime" />
                                    <asp:Parameter Name="Original_IdLog" Type="Int32" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>

                            <br />

                            <div style="text-align: center" >
                                <asp:Button ID="Btn_Accept" runat="server" Text="Accept" class="btn btn-md btn btn-success text-right " OnClick="Btn_Accept_Click"  />
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
            <!-- /.panel -->
        </div>
    </div>


</asp:Content>
