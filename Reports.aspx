<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="Reports, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="SettingsTimePeriod.ascx" TagName="SettingsTimePeriod" TagPrefix="uc1" %>
<%@ Register Src="SettingsTags.ascx" TagName="SettingsTags" TagPrefix="uc1" %>
<%@ Register Src="SettingsReport.ascx" TagName="SettingsReport" TagPrefix="uc1" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">
        function DisplayProgress()
        {
            var tagselected = false; 
            var i = 0;
            $('#ctl00_ContentPlaceHolderContent_SettingsTags1_GridViewTags tr').each(function() {
                if (i != 0)
                {
                    var selected = $(this).children('td').children('input[type=checkbox]').attr('checked');
                    if (selected) {
                        tagselected = true;
                    }
                }
                i +=1;
            });
            
            if (tagselected)
            {
                $find('<%= ModalPopupExtender1.ClientID %>').hide();
                $find('<%= ModalPopupExtenderProgress.ClientID %>').show();
                $('#ctl00_ContentPlaceHolderContent_HiddenFieldTagsSelected').val('true')
            }
            else
            {
                $('#ctl00_ContentPlaceHolderContent_HiddenFieldTagsSelected').val('false');
                alert("Please select at least one tag");
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                <tr>
                    <td>
                        <div id="toolbar">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="LinkButtonSettings" OnClick="LinkButtonSettings_Click" AutoPostback="true"
                                        runat="server">
                                        <span>
                                            <asp:Image ID="ImageSettings" runat="server" ImageUrl="App_Themes/Blue/images/settings.png" />Settings</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToWord" runat="server" OnClick="LinkButtonExportToWord_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToWord" runat="server" ImageUrl="App_Themes/Blue/images/word.png" />Export
                                            Word</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToExcel" runat="server" OnClick="LinkButtonExportToExcel_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToExcel" runat="server" ImageUrl="App_Themes/Blue/images/excel.png" />Export
                                            Excel</span></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToPDF" runat="server" OnClick="LinkButtonExportToPDF_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToPDF" runat="server" ImageUrl="App_Themes/Blue/images/pdf.png" />Export
                                            PDF</span></asp:LinkButton>
                                </li>
                                <%--<li>
                                    <asp:LinkButton ID="LinkButtonPrint" runat="server" OnClick="LinkButtonPrint_Click">
                                        <span>
                                            <asp:Image ID="ImagePrint" runat="server" ImageUrl="App_Themes/Blue/images/printer.png" />Print</span></asp:LinkButton>
                                </li>--%>
                                <li>
                                    <asp:HyperLink ID="HyperLinkHelp" runat="server"  NavigateUrl="UserManual.pdf" onclick="window.open (this.href, 'popupwindow', 'width=600,height=800,scrollbars,resizable'); return false;">
                                        <span>
                                            <asp:Image ID="ImageHelp" runat="server" ImageUrl="App_Themes/Blue/images/help.png" />Help</span></asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                            ToolPanelView="None" BackColor="White" ToolbarStyle-width="100%" BestFitPage="False"
                            HasPrintButton="True" HasExportButton="False" HasToggleGroupTreeButton="False"
                            HasToggleParameterPanelButton="False" HasCrystalLogo="False" PrintMode="ActiveX" />
                        <input type="hidden" id="HiddenFieldTagsSelected" name="HiddenFieldTagsSelected"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="LinkButtonExportToWord" />
            <asp:PostBackTrigger ControlID="LinkButtonExportToExcel" />
            <asp:PostBackTrigger ControlID="LinkButtonExportToPDF" />
        </Triggers>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderPrinters" runat="server" TargetControlID="HiddenButtonPrinter"
        PopupControlID="PanelPrinters" CancelControlID="HiddenButtonPrinter" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonPrinter" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelPrinters" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <b>Please select a Printer<br />
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Printers:
                            <asp:DropDownList ID="DropDownListPrinters" SkinID="DropDownListDefaultSkin" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">                            
                            <asp:LinkButton ID="LinkButtonPrinterSelected" OnClick="LinkButtonPrinterSelected_Click"
                                runat="server">Print</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonPrinterCancel" OnClick="LinkButtonPrinterCancel_Click"
                                runat="server">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenButton"
        PopupControlID="Panel1" CancelControlID="HiddenButton" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButton" runat="Server" Style="display: none" />
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td>
                            <div id="modal">
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
                        <td></td>
                    </tr>          
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelReportType" CssClass="GroupBox" GroupingText="Report" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            Type
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListReportType" OnSelectedIndexChanged="DropDownListReportType_SelectedIndexChanged"
                                                AutoPostBack="true" SkinID="DropDownListDefaultSkin" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Title
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxReportTitle" SkinID="TextBoxDefaultSkin330" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelRecurrence" CssClass="GroupBox" GroupingText="Rate of Aggregation"
                                runat="server">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonListRecurrence" OnSelectedIndexChanged="RadioButtonListRecurrence_SelectedIndexChanged"
                                                AutoPostBack="true" Visible="false" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Hourly" Value="0" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Daily" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Custom" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="PanelAggregateOptions" runat="server">
                                                <asp:Label ID="LabelAggregateEvery" runat="server" Text="Aggregated Every"></asp:Label>
                                                <asp:TextBox ID="TextBoxAggregateDuration" SkinID="TextBoxDefaultSkin40" runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderAggregateDuration" runat="server"
                                                    TargetControlID="TextBoxAggregateDuration" FilterType="Numbers">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:DropDownList ID="DropDownListAggregateFrequency" AutoPostBack="true" OnSelectedIndexChanged="DropDownListAggregateFrequency_SelectedIndexChanged" SkinID="DropDownListDefaultSkin"
                                                    runat="server">
                                                    <asp:ListItem Value="0">Hour(s)</asp:ListItem>
                                                    <asp:ListItem Value="1">Day(s)</asp:ListItem>
                                                    <asp:ListItem Value="2">Week(s)</asp:ListItem>
                                                    <asp:ListItem Value="3">Month(s)</asp:ListItem>
                                                </asp:DropDownList>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="PanelStatistics" runat="server" CssClass="GroupBox" GroupingText="Statistics">
                                <asp:CheckBox ID="CheckBoxAverage" Text="Average" Checked="true" Enabled="false"
                                    runat="server" />
                                <asp:CheckBox ID="CheckBoxMin" Text="Minimum" Checked="true" runat="server" />
                                <asp:CheckBox ID="CheckBoxMax" Text="Maximum" Checked="true" runat="server" />
                                <asp:CheckBox ID="CheckBoxStdDev" Text="Std. Deviation" Checked="true" runat="server" />
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
                            <asp:Panel ID="PanelTreeFacilities" runat="server" Visible="False" GroupingText="Facilities" CssClass="GroupBox">
                                <asp:TreeView ID="TreeViewFacilities" runat="server" ShowCheckBoxes="All" OnTreeNodeCheckChanged="TreeViewFacilities_TreeNodeCheckChanged"  
                                EnableClientScript="true" onclick="javascript:postBackByObject();" ClientIDMode="Static">
                                </asp:TreeView>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="LinkButtonDisplay" runat="server" Text="Display" OnClientClick="DisplayProgress()" OnClick="LinkButtonDisplay_Click"
                                AutoPostback="true" Font-Size="8"/>
                            <asp:Button ID="LinkButtonCancel" runat="server" Text="Cancel" OnClick="LinkButtonCancel_Click" AutoPostback="true" Font-Size="8"/>
                            <%--<asp:LinkButton ID="LinkButtonDisplay" OnClientClick="DisplayProgress()" OnClick="LinkButtonDisplay_Click"
                                AutoPostback="true" runat="server">Display</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" OnClick="LinkButtonCancel_Click" AutoPostback="true"
                                runat="server">Cancel</asp:LinkButton>--%>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderErrorHandler" runat="server" CancelControlID="HiddenButtonError"
        TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonError" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelErrorHandler" runat="server" CssClass="modalPopup" Style="display: none"
        ScrollBars="Vertical" Height="200px">
        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" GroupingText="Warning" runat="server" CssClass="GroupBox">
                    <table>
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="LinkButtonClose" OnClick="LinkButtonClose_Click" runat="server">Close</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxError" ReadOnly="true" TextMode="MultiLine" Rows="7" Columns="40"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                                <asp:Panel ID="Panel3" CssClass="GroupBox" GroupingText="Save with..." runat="server">                                                    
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
                                <%--<asp:LinkButton ID="LinkButtonSaveTemplate" runat="server" ValidationGroup="1" OnClick="LinkButtonSaveTemplate_Click">Save</asp:LinkButton>                                --%>
                                &nbsp;
                                <%--<asp:LinkButton ID="LinkButtonCancelTemplate" OnClick="LinkButtonCancelTemplate_Click" runat="server">Cancel</asp:LinkButton>--%>
                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="1" HeaderText="You must enter a valid value in the following fields"
                                    ShowMessageBox="true" ShowSummary="false" runat="server" />
                            </td>
                        </tr>
                     </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Panel>--%>

</asp:Content>
