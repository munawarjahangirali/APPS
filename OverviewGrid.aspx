<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="OverviewGrid, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
     <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelGrid" runat="server" ScrollBars="Vertical" BorderColor="#ADADAD"
                            BorderWidth="1">
                            <table border="0">
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:GridView ID="GridView1" GridLines="None" runat="server" OnRowCreated="GridView1_RowCreated"
                                            OnRowDataBound="GridView1_RowBound" Width="100%" ShowHeader="false">
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
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
