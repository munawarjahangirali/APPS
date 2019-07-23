
<%@ control language="C#" autoeventwireup="true" inherits="HistorianDatasource, App_Web_q1bp2ybq" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<cc1:ModalPopupExtender ID="ModalPopupExtenderError" runat="server" CancelControlID="HiddenButtonError"
    TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Button ID="HiddenButtonError" runat="Server" Style="display: none" />
<asp:Button ID="Button1" runat="Server" Style="display: none" />
<asp:Panel ID="PanelErrorHandler" runat="server" CssClass="modalPopup" Style="display: none">
    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel4" GroupingText="Message" runat="server" CssClass="GroupBox">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBoxError" SkinID="TextBoxDefaultSkin330" ReadOnly="true" TextMode="MultiLine"
                                Rows="7" Columns="40" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<asp:Panel runat="server" Width="372" HorizontalAlign="Right">
 <asp:LinkButton Visible="False"  ToolTip="Save changes"  ID="LinkButtonSave" runat="server" OnClick="LinkButtonSave_Click">Save</asp:LinkButton> </asp:Panel>
 <asp:Panel runat="server" HorizontalAlign="Right" Width = "600">
 <asp:Label runat="server" ID="SavedChangesLabel" Visible="False"></asp:Label></asp:Panel>
<asp:Panel ID="PanelDatasources" runat="server" CssClass="Panel">
    
    <table width="100%">
      
        <tr>
            <td align="center">
               
                <asp:GridView ID="GridView1" SkinID="GridViewDefaultSkin" HorizontalAlign="Justify"
                    runat="server" AutoGenerateColumns="False" DataKeyNames="ID" Width="29%">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="TYPE" ItemStyle-HorizontalAlign="Justify" HeaderText="Unit Category"
                            SortExpression="Name" />
                        <asp:TemplateField HeaderText="Unit / Rate" ItemStyle-HorizontalAlign="Justify">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListDefaultUnit" SkinID="DropDownListDefaultSkin" Width="75"  AutoPostBack="True" OnSelectedIndexChanged="DropDownListDefaultUnit_SelectedIndexChanged" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" ShowHeader="True" BorderStyle="None"
                    AutoGenerateColumns="True" HeaderText="Units" SkinID="GridViewDefaultSkin" Width="0%">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Panel>
