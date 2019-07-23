<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="SettingsConfiguration.ascx" TagName="SettingsConfiguration" TagPrefix="uc1" %>
<%@ Register Src="SettingsDatasource.ascx" TagName="SettingsDatasource" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ZDV Web Studio Login</title>
   <%-- <link rel="SHORTCUT ICON" href="favicon.ico" type="image/x-icon" />--%>
    <link rel="SHORTCUT ICON" href="favicon.jpg" />

    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function Resolution() {
            var lWidth = document.getElementById("HiddenFieldWidth");
            lWidth.value = screen.width;
            var lHeight = document.getElementById("HiddenFieldHeight");
            lHeight.value = screen.height;
        }

        function KeyDownHandler(btn) {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                document.getElementById(btn).click();
            }
        }
    </script>

</head>
<body onload="Resolution()">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="HiddenButtonError"
        TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonError" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelErrorHandler" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel1" GroupingText="Warning" runat="server" CssClass="GroupBox">
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
    <cc1:ModalPopupExtender ID="ModalPopupExtenderSettingsConfiguration" runat="server"
        CancelControlID="ButtonSettingsConfiguration" TargetControlID="ButtonSettingsConfiguration"
        PopupControlID="PanelSettingsConfiguration" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="ButtonSettingsConfiguration" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelSettingsConfiguration" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <div id="modal">
                                <ul style="width: 97%">
                                    <li><span>Configuration</span> </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <uc1:SettingsConfiguration ID="SettingsConfiguration1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 600px">
                            <uc1:SettingsDatasource ID="SettingsDatasource1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="LabelConfiguration" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>
                            <asp:LinkButton ID="LinkButtonCloseConfiguration" OnClick="LinkButtonCloseConfiguration_Click"
                                runat="server">Close</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <div>
        <table style="text-align: center" border="0" width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="images/img1.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/images/logo1.png" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Panel ID="PanelLogin" CssClass="GroupBox" GroupingText="Login" Width="275px"
                        runat="server">
                        <table border="0">
                            <tr>
                                <td>
                                    <asp:Label ID="LabelUsername" runat="server" Text="Username:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxUserName" SkinID="TextBoxDefaultSkin" runat="server">Zysadm</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxUserName"
                                        ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Username">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelPassword" runat="server" Text="Password:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPassword" TextMode="Password" SkinID="TextBoxDefaultSkin"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxPassword"
                                        ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Password">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <asp:LinkButton ID="LinkButtonDatasourceConfiguration" OnClick="LinkButtonDatasourceConfiguration_Click"
                                        Visible="false" runat="server">Configure</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLogin" ValidationGroup="1" runat="server" OnClick="LinkButtonLogin_Click">Login</asp:LinkButton>
                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="1" HeaderText="You must enter a valid value in the following fields"
                                        ShowMessageBox="true" ShowSummary="false" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelLoginFailed" CssClass="GroupBox" GroupingText="Login Failed"
                        Visible="false" Width="275px" runat="server">
                        <table border="0">
                            <tr>
                                <td>
                                    Username or password are not valid<br />
                                    Please try again!
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:LinkButton ID="LinkButtonLoginAgain" ValidationGroup="1" runat="server" 
                                        OnClick="LinkButtonLoginAgain_Click" AccessKey=" ">Login</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="70%" border="0">
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td>
                                            <b>Zencus Support</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            United Kingdom
                                        </td>
                                        <td>
                                            0044 20 7384 9332
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Qatar
                                        </td>
                                        <td>
                                            00974 5501 7205
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Saudi Arabia
                                        </td>
                                        <td>
                                            00966 5531 14585
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <b>Build 2.0.8</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink Target="_blank" NavigateUrl="http://www.zencus.com" ID="HyperLink1"
                                                runat="server">www.zencus.com</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldWidth" runat="server" />
        <asp:HiddenField ID="HiddenFieldHeight" runat="server" />
    </div>
    </form>
</body>
</html>
