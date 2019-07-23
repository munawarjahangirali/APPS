<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="OverviewSchematic, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function ShowAlarmModalPopup(ID) {
            $("#<%=LabelAlarmDetails.ClientID %>").html(ID);
            $("#dialog").dialog('open');
        }
        
         function ShowAlarmSetPointModalPopup(ID) {
            $("#<%=LabelAlarmDetailsSetPoint.ClientID %>").html(ID);
            $("#dialogSetPoint").dialog('open');
        }
        
        function ShowAlarmStatusModalPopup(ID) {
            $("#<%=LabelAlarmDetailsStatus.ClientID %>").html(ID);
            $("#dialogStatus").dialog('open');
        }

        $(document).ready(function() {
            $("#dialog").dialog({
                autoOpen: false,
                height: 'auto',
                width: 130,
                modal: true
            });
            
            $("#dialogSetPoint").dialog({
                autoOpen: false,
                height: 'auto',
                width: 170,
                modal: true
            });
            
            $("#dialogStatus").dialog({
                autoOpen: false,
                height: 'auto',
                width: 170,
                modal: true
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <div id="dialog" title="Range Alarms">
        <p>
            <asp:Label ID="LabelAlarmDetails" runat="server" Text="Label"></asp:Label></p>
    </div>
    <div id="dialogSetPoint" title="Range Alarms">
        <p>
            <asp:Label ID="LabelAlarmDetailsSetPoint" runat="server" Text="Label"></asp:Label></p>
    </div>
    <div id="dialogStatus" title="Status Alarm">
        <p>
            <asp:Label ID="LabelAlarmDetailsStatus" runat="server" Text="Label"></asp:Label></p>
    </div>
    <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="toolbar">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="LinkButtonCurrentAlarms" OnClick="LinkButtonCurrentAlarms_Click"
                                        AutoPostback="true" runat="server">
                                        <span>
                                            <asp:Image ID="ImageSettings" runat="server" ImageUrl="App_Themes/Blue/images/alarms.png" />Alarms</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLinkHelp" runat="server"  NavigateUrl="UserManual.pdf" onclick="window.open (this.href, 'popupwindow', 'width=600,height=800,scrollbars,resizable'); return false;">
                                        <span>
                                            <asp:Image ID="ImageHelp" runat="server" ImageUrl="App_Themes/Blue/images/help.png" />Help</span></asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelAlarms" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelSchematicImage" runat="server" CssClass="OverviewSchematic">
                        </asp:Panel>
                        <%--<asp:Panel ID="PanelAlarms" runat="server" GroupingText="Current Active Alarms" CssClass="GroupBox">
                            <asp:GridView ID="GridViewAlarms" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                    <asp:BoundField DataField="Type" ItemStyle-HorizontalAlign="Center" HeaderText="Type" />
                                    <asp:BoundField DataField="Activated" ItemStyle-HorizontalAlign="Center" HeaderText="Activated" />
                                    <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Value" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
                            TargetControlID="PanelAlarms" VerticalSide="Top" VerticalOffset="60" HorizontalSide="Right"
                            HorizontalOffset="30" ScrollEffectDuration=".1">
                        </cc1:AlwaysVisibleControlExtender>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenButton"
        PopupControlID="Panel1" CancelControlID="HiddenButton" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButton" runat="Server" Style="display: none" />
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="PanelAlarms" runat="server" GroupingText="Current Active Alarms" CssClass="GroupBox">
                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="GridViewAlarms" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                        <asp:BoundField DataField="Type" ItemStyle-HorizontalAlign="Center" HeaderText="Type" />
                                        <asp:BoundField DataField="Activated" ItemStyle-HorizontalAlign="Center" HeaderText="Activated" />
                                        <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Value" />
                                    </Columns>
                                </asp:GridView>
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
</asp:Content>
