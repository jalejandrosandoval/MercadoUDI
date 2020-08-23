<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterDefault.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Parcial02_MercadoUDi.ShoppingCart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <form role="form" id="form1" runat="server">

        <div class="col-md-12">
            <h2 class="page-header">Shopping Cart</h2>
        </div>

        <div class="col-md-12">
            <div class="divider"></div>
        </div>

        <div class="col-md-8 col-md-offset-4">
            
            <div>

                <asp:GridView ID="GridView_Shopping" runat="server" 
                    OnRowDeleting="GridView_Shopping_RowDeleting"
                    OnRowEditing="GridView_Shopping_RowEditing"
                    OnRowCancelingEdit="GridView_Shopping_RowCancelingEdit"
                    OnRowUpdating="GridView_Shopping_RowUpdating" 
                    GridLines="Both" 
                    BorderWidth="1px" DataKeyNames="ProductId,Quantity">
                    <Columns>
                        <asp:CommandField EditText="Edit" SelectText="Select" ShowEditButton="True" UpdateText="Update" CancelText="Cancel"/>
                        <asp:CommandField DeleteText="Delete" ShowDeleteButton="True" />

                        <asp:TemplateField HeaderText="Product Code">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ProductName">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ProductImage">
                            <EditItemTemplate>
                                <asp:Image ID="Label3" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Width="100px"></asp:Image>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# Bind("ProductImage") %>' Width="100px"></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Center">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Quantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txt_Quantity"
                                            ErrorMessage="(Only numbers)"
                                            ForeColor="Red"
                                            ValidationExpression="^[0-9]*">
                                        </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product Price" ItemStyle-HorizontalAlign="Right">
                            <EditItemTemplate>
                                $ <asp:Label ID="Label5" runat="server" Text=' <%# Eval("ProductPriceUnitary") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                $ <asp:Label ID="Label6" runat="server" Text=' <%# Bind("ProductPriceUnitary") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
                <br />
                <br />

            </div>

            <div>
                <div class="col-md-6 col-md-offset-6">
                    <h4>
                        <b>
                            <asp:Label ID="label9" runat="server" Text="Total:  $"/>
                        </b>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="color: #FF0000">
                            <asp:Label ID="labelTotal" runat="server" />
                        </span>
                    </h4>
                </div>
                <br />
                <br />

            </div>

            <br />
            <br />

            <div>
                <div class="col-md-4 col-md-offset-6">
                    <asp:Button ID="btn_Purchase" runat="server" class="btn btn-block btn-success" Text="Purchase" OnClick="btn_Purchase_Click" />
                </div>
            </div>

        </div>
    
    </form>

</asp:Content>
