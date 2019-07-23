<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="OverviewDashboard, App_Web_nvkiirpv" theme="Grey" %>

<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">
        function DisplayProgress() {
           $find('<%= ModalPopupExtenderProgress.ClientID %>').show();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table border="0" width="100%">
                <tr>
                    <td style="width: 50%" valign="top">
                        <asp:Panel ID="PanelActiveAlarms" CssClass="GroupBox" GroupingText="Active Alarms"
                            runat="server">
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <table style="text-align: left" border="0">
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListAlarmOptions" AutoPostBack="true" SkinID="DropDownListDefaultSkin"
                                                        OnSelectedIndexChanged="DropDownListAlarmOptions_SelectedIndexChanged" runat="server">
                                                        <asp:ListItem Text="Currently Active"></asp:ListItem>
                                                        <asp:ListItem Text="Historical Active"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="PanelAlarmGrids" ScrollBars="Vertical" runat="server">
                                            <asp:GridView ID="GridViewActiveAlarms" SkinID="GridViewDefaultSkin" AutoGenerateColumns="False"
                                                runat="server" Width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                                    <asp:BoundField DataField="Activated" ItemStyle-HorizontalAlign="Center" HeaderText="Time" />
                                                    <asp:BoundField DataField="ActivatedValue" ItemStyle-HorizontalAlign="Center" HeaderText="Activated" />
                                                    <asp:BoundField DataField="CurrentValue" ItemStyle-HorizontalAlign="Center" HeaderText="Current" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="GridViewHistoricalAlarms" Visible="false" SkinID="GridViewDefaultSkin"
                                                AutoGenerateColumns="False" runat="server" Width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                                    <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Activated" />
                                                    <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Value" />
                                                    <asp:BoundField DataField="Status" ItemStyle-HorizontalAlign="Center" HeaderText="Deactivated" />
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td style="width: 50%" valign="top">
                        <asp:Panel ID="PanelTop" CssClass="GroupBox" GroupingText="Top" runat="server">
                            <table width="100%" border="0">
                                <tr>
                                    <td align="left">
                                        <table style="text-align: left" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TextBoxTopAmount" SkinID="TextBoxDefaultSkin40" AutoPostBack="true"
                                                        OnTextChanged="TextBoxTopAmount_TextChanged" runat="server"></asp:TextBox>
                                                    <%-- <asp:Label ID="LabelMin" runat="server" Text="Range Min:"></asp:Label>
                                        <asp:TextBox ID="TextBoxRangeMin" SkinID="TextBoxDefaultSkin40" AutoPostBack="true" OnTextChanged="TextBoxRangeMin_TextChanged" runat="server"></asp:TextBox>--%>
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ID="RadioButtonListTopTypes" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonListTopTypes_SelectedIndexChanged"
                                                        runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="0" Text="Highest" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Lowest"></asp:ListItem>
                                                        <%--<asp:ListItem Value="2" Text="Custom"></asp:ListItem>--%>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:DropDownList ID="DropDownListTagTypes" SkinID="DropDownListDefaultSkin" runat="server"
                                                        OnSelectedIndexChanged="DropDownListTagTypes_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="PanelTopGrid" ScrollBars="Vertical" runat="server">
                                            <asp:GridView ID="GridViewRealTime" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False"
                                                Width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="Tag" ItemStyle-HorizontalAlign="Center" HeaderText="Tag" />
                                                    <asp:BoundField DataField="Type" ItemStyle-HorizontalAlign="Center" HeaderText="Type" />
                                                    <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Time" />
                                                    <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Value" />
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderProgress" runat="server" TargetControlID="PanelProgress"
        PopupControlID="PanelProgress" BackgroundCssClass="modalBackground" Drag="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PanelProgress" runat="server" CssClass="modalPopup" Style="display: none">
        <table border="0" cellpadding="2" cellspacing="0" style="width: 100%">
            <tbody>
                <tr>
                    <td style="width: 50%">
                    </td>
                    <td style="text-align: right">
                        <img alt="" src="images/loader.gif" />
                    </td>
                    <td style="text-align: left; white-space: nowrap">
                        Loading, please be patient ...
                    </td>
                    <td style="width: 50%">
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    <%--<cc1:ModalPopupExtender ID="ModalPopupExtenderError" runat="server" CancelControlID="LinkButtonClose"
        TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground"
        >
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
                                <asp:LinkButton ID="LinkButtonClose" runat="server">Close</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>
     <asp:Panel ID="pnlError" runat="server" Style="display: none;" CssClass="modalPopup">
        <div style="text-align: center;">
            <asp:Literal ID="LiteralError" runat="server"></asp:Literal>
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
            <br />
            <br />
            <asp:LinkButton ID="lnkErrorOK" runat="server" Text=""></asp:LinkButton>
        </div>
    </asp:Panel>
    <asp:LinkButton ID="lnkErrorBtn" runat="server" Style="display: none;"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="mpeErrorBox" runat="server" PopupControlID="pnlError"
        OkControlID="lnkErrorOK" TargetControlID="lnkErrorBtn" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
</asp:Content>
