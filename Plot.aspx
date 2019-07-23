<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="Plot, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="SettingsTimePeriod.ascx" TagName="SettingsTimePeriod" TagPrefix="uc1" %>
<%@ Register Src="SettingsTags.ascx" TagName="SettingsTags" TagPrefix="uc1" %>
<%@ Register Assembly="DundasWebChart" Namespace="Dundas.Charting.WebControl" TagPrefix="DCWC" %>
<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">
        function DisplayProgress() {
            var tagselected = false; 
            var i = 0;
            $('#ctl00_ContentPlaceHolderContent_SettingsTags1_GridViewTags tr').each(function() {
                if (i != 0) {
                    var selected = $(this).children('td').children('input[type=checkbox]').attr('checked');
                    if (selected) {
                        tagselected = true;
                    }
                }
                i +=1;
            });
            
            if (tagselected) {
                $find('<%= ModalPopupExtender1.ClientID %>').hide();
                $find('<%= ModalPopupExtenderProgress.ClientID %>').show();
                $('#ctl00_ContentPlaceHolderContent_HiddenFieldTagsSelected').val('true')
            }
            else {
                $('#ctl00_ContentPlaceHolderContent_HiddenFieldTagsSelected').val('false');
                alert("Please select at least one tag");
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="toolbar">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="LinkButtonSettings" OnClick="LinkButtonSettings_Click" AutoPostback="true"
                                        runat="server">
                                        <span>
                                            <asp:Image ID="ImageSettings" runat="server" ImageUrl="App_Themes/Blue/images/settings.png" />Settings</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToExcel" runat="server" OnClick="LinkButtonExportToExcel_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToExcel" runat="server" ImageUrl="App_Themes/Blue/images/excel.png" />Export
                                            Excel</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToCSV" runat="server" OnClick="LinkButtonExportToCSV_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToCSV" runat="server" ImageUrl="App_Themes/Blue/images/csv.png" />Export
                                            CSV</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:CheckBox ID="CheckBoxAutoRefresh" Text="Auto Refresh" OnCheckedChanged="CheckBoxAutoRefresh_CheckedChanged"
                                        AutoPostBack="true" runat="server" ForeColor="White" />
                                </li>
                                <li>
                                    <asp:HyperLink ID="HyperLinkHelp" runat="server" NavigateUrl="UserManual.pdf" onclick="window.open (this.href, 'popupwindow', 'width=600,height=800,scrollbars,resizable'); return false;">
                                        <span>
                                            <asp:Image ID="ImageHelp" runat="server" ImageUrl="App_Themes/Blue/images/help.png" />Help</span></asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="CheckBoxAutoRefresh" />
                        <asp:PostBackTrigger ControlID="LinkButtonExportToExcel" />
                        <asp:PostBackTrigger ControlID="LinkButtonExportToCSV" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <DCWC:Chart ID="Chart1" runat="server" Palette="Pastel" OnCallback="Chart1_Callback"
                                ImageStorageMode="UseHttpHandler">
                                <%--  <Legends>
                                    <DCWC:Legend Name="Default" LegendStyle="Column">
                                    </DCWC:Legend>
                                </Legends>--%>
                                <ChartAreas>
                                    <DCWC:ChartArea Name="Default">
                                    </DCWC:ChartArea>
                                </ChartAreas>
<Legends>
<DCWC:Legend Name="Default" Alignment="Center" Docking="Bottom"></DCWC:Legend>
</Legends>
                            </DCWC:Chart>
                            <input type="hidden" id="HiddenFieldTagsSelected" name="HiddenFieldTagsSelected"
                                runat="server" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>--%>
                </table>
            </td>
        </tr>
    </table>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenButton"
        PopupControlID="Panel1" CancelControlID="HiddenButton" BackgroundCssClass="modalBackground"
        Drag="true">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButton" runat="Server" Style="display: none" />
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td>
                            <div class="modal"><%--id="modal"--%>
                                <ul style="width: 95%; text-align:center">
                                    <li><span>Settings</span></li>                                    
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>                        
                        <td>
                             <asp:Panel ID="PanelDataSetTemplate" CssClass="GroupBox" GroupingText="Data Set Template"
                                runat="server">
                            <b>&nbsp Select Template:</b>
                            <asp:DropDownList ID="DropDownListTagsTemplate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListTagsTemplate_SelectedIndexChanged" Font-Size="8">                                
                                <asp:ListItem Text="..... None ....." Value="-1"> </asp:ListItem>                                
                                <asp:ListItem Text="-----------------------" Value="-1"> </asp:ListItem>                                
                            </asp:DropDownList> 
                            <asp:Button ID="btnCreateTemplate" runat="server" Text="New..." OnClick="btnCreateTemplate_Click" Font-Size="8" />                           
                            <asp:Button ID="btnDeleteTemplate" runat="server" Text="Delete"
                            OnClick="btnDeleteTemplate_Click" Font-Size="8" />
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelRecurrence" CssClass="GroupBox" GroupingText="Rate of Aggregation"
                                runat="server">
                                <asp:RadioButtonList ID="RadioButtonListRecurrence" OnSelectedIndexChanged="RadioButtonListRecurrence_SelectedIndexChanged"
                                    AutoPostBack="true" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Real-Time" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Hourly" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Daily" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Custom" Value="3"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Panel ID="PanelCustom" Visible="false" runat="server">
                                    <asp:Label ID="LabelAggregateEvery" runat="server" Text="Aggregated Every"></asp:Label>
                                    <asp:TextBox ID="TextBoxAggregateDuration" SkinID="TextBoxDefaultSkin40" runat="server"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderAggregateDuration" runat="server"
                                        TargetControlID="TextBoxAggregateDuration" FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                    <asp:DropDownList ID="DropDownListAggregateFrequency" OnSelectedIndexChanged="RadioButtonListRecurrence_SelectedIndexChanged"
                                        AutoPostBack="true" SkinID="DropDownListDefaultSkin" runat="server">
                                        <asp:ListItem Value="0">Hour(s)</asp:ListItem>
                                        <asp:ListItem Value="1">Day(s)</asp:ListItem>
                                        <asp:ListItem Value="2">Week(s)</asp:ListItem>
                                        <asp:ListItem Value="3">Month(s)</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelStatistics" CssClass="GroupBox" GroupingText="Statistics" runat="server">
                                <asp:CheckBox ID="CheckBoxMin" Text="Minimum" Checked="true" runat="server" />
                                <asp:CheckBox ID="CheckBoxMax" Text="Maximum" Checked="true" runat="server" />
                                <asp:CheckBox ID="CheckBoxStdDev" Text="Std. Deviation" Checked="true" runat="server" />
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelFilters" runat="server">
                                <asp:Panel ID="PanelRealTimeFilter" CssClass="GroupBox" GroupingText="Data Filtered As Follows"
                                    runat="server">
                                    <table style="text-align: left">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelRealTime1" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <b>Real-Time</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelRealTime2" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <b>Standard Deviation Filter Applied</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelRealTime3" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <b>Not Permitted</b>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelAggregateHourly" CssClass="GroupBox" GroupingText="Data Filtered As Follows"
                                    runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelAggregate1" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <b>Hourly</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelAggregate2" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <b>Not Permitted</b>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <uc1:SettingsTimePeriod ID="SettingsTimePeriod1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <uc1:SettingsTags ID="SettingsTags1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="LinkButtonPlot" runat="server" Text="Plot" OnClientClick="DisplayProgress()" OnClick="LinkButtonPlot_Click"
                                AutoPostback="true" Font-Size="8"/>
                            <asp:Button ID="LinkButtonCancel" runat="server" Text="Cancel" OnClick="LinkButtonCancel_Click" AutoPostback="true" Font-Size="8"/>
                            <%--<asp:LinkButton ID="LinkButtonPlot" OnClientClick="DisplayProgress()" OnClick="LinkButtonPlot_Click"
                                AutoPostback="true" runat="server">Plot</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" OnClick="LinkButtonCancel_Click" AutoPostback="true"
                                runat="server">Cancel</asp:LinkButton>--%>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="LinkButtonPlot" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    
    <cc1:ModalPopupExtender ID="ModalPopupExtenderNoTagsFound" runat="server" TargetControlID="Button2"
        PopupControlID="PanelNoTags" CancelControlID="Button2" BackgroundCssClass="modalBackground"
        Drag="true">
    </cc1:ModalPopupExtender>
    <asp:Button ID="Button2" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelNoTags" runat="server" CssClass="modalPopup" Style="display: none"
        ScrollBars="Vertical">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div id="modal">
                    <ul style="width: 95%">
                        <li>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <span>Message</span>
                                    </td>
                                    <td align="right">
                                        <asp:LinkButton ID="LinkButtonClose" OnClick="LinkButtonClose_Click" ForeColor="White"
                                            runat="server">Close</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
                <%--<asp:TextBox ID="TextBoxOtherErrors" runat="server"></asp:TextBox>--%>
                <table border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td valign="top">
                            <asp:Repeater ID="RepeaterNoTag" runat="server">
                                <HeaderTemplate>
                                    <table>
                                        <%--<tr>
                                            <td>
                                                <b>Warning</b>
                                            </td>
                                        </tr>--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# (Container.DataItem).ToString() %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="RepeaterNoReading" runat="server">
                                <HeaderTemplate>
                                    <table width="200px">
                                        <tr>
                                            <td>
                                                <b>No Readings</b>
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# (Container.DataItem).ToString() %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    
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

    <%--<cc1:ModalPopupExtender ID="ModalPopupExtenderTagTemplate" runat="server" TargetControlID="HiddenButtonTagTemplate"
                PopupControlID="PanelTagTemplate" CancelControlID="HiddenButtonTagTemplate" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonTagTemplate" runat="Server" Style="display: none" />

    <asp:Panel ID="PanelTagTemplate" runat="server" CssClass="modalPopup" Style="display: none; width:22%">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <div id="div1" class="modal">
                    <ul style="width: 94%">
                        <li><span>Create Template</span> </li>
                    </ul>
                </div>
                <asp:Panel ID="PanelTemplate" runat="server" CssClass="Panel">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left">
                                Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxName" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                                <asp:Label ID="LabelIsDuplicateTag" ForeColor="Red" Visible="false" runat="server"
                                    Text="Already Exists!"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxName"
                                    ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Name">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxIsDefeault" Text="IsDefault" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <asp:HiddenField ID="HiddenFieldID" runat="server" />                                
                                <asp:LinkButton ID="LinkButtonSaveTemplate" runat="server" ValidationGroup="1" OnClick="LinkButtonSaveTemplate_Click">Save</asp:LinkButton>                                
                                &nbsp;
                                <asp:LinkButton ID="LinkButtonCancelTemplate" OnClick="LinkButtonCancelTemplate_Click" runat="server">Cancel</asp:LinkButton>
                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="1" HeaderText="You must enter a valid value in the following fields"
                                    ShowMessageBox="true" ShowSummary="false" runat="server" />
                            </td>
                        </tr>
                     </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Panel>
--%>

<cc1:ModalPopupExtender ID="ModalPopupExtenderTagTemplate" runat="server" TargetControlID="HiddenButtonTagTemplate"
                PopupControlID="PanelTagTemplate" CancelControlID="HiddenButtonTagTemplate" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonTagTemplate" runat="Server" Style="display: none" />

    <asp:Panel ID="PanelTagTemplate" runat="server" CssClass="modalPopup" Style="display: none; width:16%">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <div id="div1" class="modal">
                    <ul style="width: 91%">
                        <li><span>Create Template</span> </li>
                    </ul>
                </div>
                <asp:Panel ID="PanelTemplate" runat="server" CssClass="Panel">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left" colspan="2">
                                Name:                            
                                <asp:TextBox ID="TextBoxName" runat="server" SkinID="TextBoxDefaultSkin"></asp:TextBox>
                                <asp:Label ID="LabelIsDuplicateTag" ForeColor="Red" Visible="false" runat="server"
                                    Text="Already Exists!"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxName"
                                    ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Name">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel2" CssClass="GroupBox" GroupingText="Save with..." runat="server">                                                    
                                <asp:RadioButtonList ID="RadioButtonListSaveWith" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonListSaveWith_SelectedIndexchanged">
                                    <asp:ListItem Text="Tags" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Tag Types" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                                    <%--<asp:RadioButton ID="RadioButtonTags" Text="Tags" runat="server" GroupName="Tag" Checked="True" OnCheckedChanged="RadioButtonTagsChanged(this)" />
                                    <asp:RadioButton ID="RadioButtonTagTypes" Text="Tag Types" runat="server" GroupName="Tag"/>--%>
                                </asp:Panel>                                                                  
                            </td>
                        </tr>
                        <tr>
                            <td>
                                  <asp:Panel ID="Panel4" CssClass="GroupBox" GroupingText="Set default to..." runat="server">                                                   
                                    <asp:CheckBoxList ID="CheckBoxListSetDefault" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Facility" Value="0" />
                                        <asp:ListItem Text="Facility type" Value="1" Enabled="false" />
                                    </asp:CheckBoxList>                                    
                                </asp:Panel>
                            </td>                            
                        </tr>    
                        <tr>
                            <td colspan="2" align="right">
                                <asp:HiddenField ID="HiddenFieldID" runat="server" />                                
                                <asp:HiddenField ID="HiddenFieldDatasetTemplateID" runat="server" />                                
                                <asp:LinkButton ID="LinkButtonSaveTemplate" runat="server" ValidationGroup="1" OnClick="LinkButtonSaveTemplate_Click">Save</asp:LinkButton>                                
                                &nbsp;
                                <asp:LinkButton ID="LinkButtonCancelTemplate" OnClick="LinkButtonCancelTemplate_Click" runat="server">Cancel</asp:LinkButton>
                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="1" HeaderText="You must enter a valid value in the following fields"
                                    ShowMessageBox="true" ShowSummary="false" runat="server" />
                            </td>
                        </tr>
                     </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Panel>

</asp:Content>
