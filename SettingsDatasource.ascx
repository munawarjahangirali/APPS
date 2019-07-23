<%@ control language="C#" autoeventwireup="true" inherits="SettingsDatasource, App_Web_q1bp2ybq" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<cc1:ModalPopupExtender ID="ModalPopupExtenderError" runat="server" CancelControlID="HiddenButtonError"
    TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Button ID="HiddenButtonError" runat="Server" Style="display: none" />
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
                    <tr>
                        <td align="right">
                            <asp:LinkButton ID="LinkButtonClose" OnClick="LinkButtonClose_Click" runat="server">Close</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<asp:Panel ID="PanelSiteDatasources" runat="server" CssClass="Panel">
    <table width="100%">
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%# Bind("ID") %>'
                                    OnClick="LinkButtonEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" ItemStyle-HorizontalAlign="Center" HeaderText="Name"
                            SortExpression="Name" />
                        <asp:BoundField DataField="Type" ItemStyle-HorizontalAlign="Center" HeaderText="Type"
                            SortExpression="Type" />
                        <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False"
                            ReadOnly="True" SortExpression="ID" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Panel>
<cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenButton"
    PopupControlID="Panel1" CancelControlID="HiddenButton" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Button ID="HiddenButton" runat="Server" Style="display: none" />
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelDatasource" runat="server" CssClass="Panel">
                <div id="modal">
                    <ul style="width: 94%">
                        <li><span>Datasource</span> </li>
                    </ul>
                </div>
                <table border="0" width="100%">
                    <tr>
                        <td>
                            Name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxName" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxName"
                                ValidationGroup="Datasource" runat="server" SetFocusOnError="true" ErrorMessage="Name">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Type:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxType" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxType"
                                ValidationGroup="Datasource" runat="server" SetFocusOnError="true" ErrorMessage="Type">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Server:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxServer" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBoxServer"
                                ValidationGroup="Datasource" runat="server" SetFocusOnError="true" ErrorMessage="Server">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Source:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxSource" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBoxSource"
                                ValidationGroup="Datasource" runat="server" SetFocusOnError="true" ErrorMessage="Source">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxUsername" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxPassword" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:HiddenField ID="HiddenFieldID" runat="server" />
                            <asp:LinkButton ID="LinkButtonSave" runat="server" ValidationGroup="Datasource" OnClick="LinkButtonSave_Click">Save</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" OnClick="LinkButtonCancel_Click" runat="server">Cancel</asp:LinkButton>
                            <asp:ValidationSummary ID="ValidationSummaryDatasource" ValidationGroup="Datasource"
                                HeaderText="You must enter a valid value in the following fields" ShowMessageBox="true"
                                ShowSummary="false" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="LabelError" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
