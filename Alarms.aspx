<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" enableeventvalidation="false" inherits="Alarms, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="SettingsTimePeriod.ascx" TagName="SettingsTimePeriod" TagPrefix="uc1" %>
<%@ Register Src="SettingsTags.ascx" TagName="SettingsTags" TagPrefix="uc1" %>
<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
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
    
    function FocusTextBoxLoLoEdit()
    {
        $("#<%=TextBoxLoLoEdit.ClientID %>").focus();
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function FocusTextBoxLoEdit()
    {
        $("#<%=TextBoxLoEdit.ClientID %>").focus();
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function FocusTextBoxHiEdit()
    {
        $("#<%=TextBoxHiEdit.ClientID %>").focus();
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function FocusTextBoxHiHiEdit()
    {
        $("#<%=TextBoxHiHiEdit.ClientID %>").focus();
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function FocusCheckBoxLoLoEdit()
    {
        $("#<%=CheckBoxLoLoEdit.ClientID %>").attr('checked', 'checked');
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
     function FocusCheckBoxLoEdit()
    {
        $("#<%=CheckBoxLoEdit.ClientID %>").attr('checked', 'checked');
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
     function FocusCheckBoxHiEdit()
    {
        $("#<%=CheckBoxHiEdit.ClientID %>").attr('checked', 'checked');
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
     function FocusCheckBoxHiHiEdit()
    {
        $("#<%=CheckBoxHiHiEdit.ClientID %>").attr('checked', 'checked');
        $("#<%=RadioButtonHiLoEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function HiLoSelected()
    {
        $("#<%=TextBoxLoLoEdit.ClientID %>").focus();
    }
    
    function SetPointPercentageSelected()
    {
        $("#<%=TextBoxSetpointPercentageEdit.ClientID %>").focus();
    }
    
    function SetPointValueSelected()
    {
        $("#<%=TextBoxSetpointValueEdit.ClientID %>").focus();
    }
    
    function RadioButtonSetPointPercentageEditSelect()
    {
        $("#<%=RadioButtonSetPointPercentageEdit.ClientID %>").attr('checked', 'checked');
    }
    
    function RadioButtonSetPointValueEditSelect()
    {
        $("#<%=RadioButtonSetPointValueEdit.ClientID %>").attr('checked', 'checked');
    }
        
    function SaveModal() {
        var valid = false;

        var HiLo = $("#ctl00_ContentPlaceHolderContent_RadioButtonHiLoEdit").attr("checked");
        var SetPointPercentage = $("#ctl00_ContentPlaceHolderContent_RadioButtonSetPointPercentageEdit").attr("checked");
        var SetPointValue = $("#ctl00_ContentPlaceHolderContent_RadioButtonSetPointValueEdit").attr("checked");

        if (HiLo) {
            valid = true;

            var CheckBoxLoLoEdit = $("#ctl00_ContentPlaceHolderContent_CheckBoxLoLoEdit").attr("checked");
            var CheckBoxLoEdit = $("#ctl00_ContentPlaceHolderContent_CheckBoxLoEdit").attr("checked");
            var CheckBoxHiEdit = $("#ctl00_ContentPlaceHolderContent_CheckBoxHiEdit").attr("checked");
            var CheckBoxHiHiEdit = $("#ctl00_ContentPlaceHolderContent_CheckBoxHiHiEdit").attr("checked");

            var TextBoxLoLoEdit;
            if (CheckBoxLoLoEdit)
                TextBoxLoLoEdit = $("#ctl00_ContentPlaceHolderContent_TextBoxLoLoEdit").val();
            else
                TextBoxLoLoEdit = $("#ctl00_ContentPlaceHolderContent_HiddenFieldLoLoEdit").val();
            var TextBoxLoEdit;
            if (CheckBoxLoEdit)
                TextBoxLoEdit = $("#ctl00_ContentPlaceHolderContent_TextBoxLoEdit").val();
            else
                TextBoxLoEdit = $("#ctl00_ContentPlaceHolderContent_HiddenFieldLoEdit").val();
            var TextBoxHiEdit;
            if (CheckBoxHiEdit)
                TextBoxHiEdit = $("#ctl00_ContentPlaceHolderContent_TextBoxHiEdit").val();
            else
                TextBoxHiEdit = $("#ctl00_ContentPlaceHolderContent_HiddenFieldHiEdit").val();
            var TextBoxHiHiEdit;
            if (CheckBoxHiHiEdit)
                TextBoxHiHiEdit = $("#ctl00_ContentPlaceHolderContent_TextBoxHiHiEdit").val();
            else
                TextBoxHiHiEdit = $("#ctl00_ContentPlaceHolderContent_HiddenFieldHiHiEdit").val();

            //LoLo Checks
            if (CheckBoxLoLoEdit && TextBoxLoLoEdit != "" && TextBoxLoEdit != "") {
                if (parseInt(TextBoxLoLoEdit) > parseInt(TextBoxLoEdit)) {
                    alert("LoLo Range Alarm must be less than Lo Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxLoLoEdit").focus();
                    valid = false;
                }
            }
            else if (CheckBoxLoLoEdit && TextBoxLoLoEdit != "" && TextBoxHiEdit != "") {
                if (parseInt(TextBoxLoLoEdit) > parseInt(TextBoxHiEdit)) {
                    alert("LoLo Range Alarm must be less than Hi Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxLoLoEdit").focus();
                    valid = false;
                }
            }
            else if (CheckBoxLoLoEdit && TextBoxLoLoEdit != "" && TextBoxHiHiEdit != "") {
                if (parseInt(TextBoxLoLoEdit) > parseInt(TextBoxHiHiEdit)) {
                    alert("LoLo Range Alarm must be less than HiHi Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxLoLoEdit").focus();
                    valid = false;
                }
            }
            //Lo Checks
            else if (CheckBoxLoEdit && TextBoxLoEdit != "" && TextBoxHiEdit != "") {
                if (parseInt(TextBoxLoEdit) > parseInt(TextBoxHiEdit)) {
                    alert("Lo Range Alarm must be less than Hi Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxLoEdit").focus();
                    valid = false;
                }
            }
            else if (CheckBoxLoEdit && TextBoxLoEdit != "" && TextBoxHiHiEdit != "") {
                if (parseInt(TextBoxLoEdit) > parseInt(TextBoxHiHiEdit)) {
                    alert("Lo Range Alarm must be less than HiHi Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxLoEdit").focus();
                    valid = false;
                }
            }
            //Hi Checks
            else if (CheckBoxHiEdit && TextBoxHiEdit != "" && TextBoxHiHiEdit != "") {
                if (parseInt(TextBoxHiEdit) > parseInt(TextBoxHiHiEdit)) {
                    alert("Hi Range Alarm must be less than HiHi Range Alarm");
                    $("#ctl00_ContentPlaceHolderContent_TextBoxHiEdit").focus();
                    valid = false;
                }
            }
            return valid;
        }
        else if (SetPointPercentage) {
            var TextBoxSetpointPercentage = $("#ctl00_ContentPlaceHolderContent_TextBoxSetpointPercentageEdit").val();
            var TextBoxPercentage = $("#ctl00_ContentPlaceHolderContent_TextBoxPercentageEdit").val();
            if (TextBoxSetpointPercentage == "") {
                alert("Setpoint is required");
                $("#ctl00_ContentPlaceHolderContent_TextBoxSetpointPercentageEdit").focus();
            }
            else if (TextBoxPercentage == "") {
                alert("Percentage is required");
                $("#ctl00_ContentPlaceHolderContent_TextBoxPercentageEdit").focus();
            }
            else {
                valid = true;
            }
            return valid;
        }
        else if (SetPointValue) {
            var TextBoxSetpointValue = $("#ctl00_ContentPlaceHolderContent_TextBoxSetpointValueEdit").val();
            var TextBoxValue = $("#ctl00_ContentPlaceHolderContent_TextBoxValueEdit").val();
            if (TextBoxSetpointValue == "") {
                alert("Setpoint is required");
                $("#ctl00_ContentPlaceHolderContent_TextBoxSetpointValueEdit").focus();
            }
            else if (TextBoxValue == "") {
                alert("Value is required");
                $("#ctl00_ContentPlaceHolderContent_TextBoxValueEdit").focus();
            }
            else {
                valid = true;
            }
            return valid;
        }
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="Server">
    <cc1:ModalPopupExtender ID="ModalPopupExtenderError" runat="server" CancelControlID="HiddenButtonError"
        TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButtonError" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelErrorHandler" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" GroupingText="Warning" runat="server" CssClass="GroupBox">
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxError" SkinID="TextBoxDefaultSkin330" ReadOnly="true" TextMode="MultiLine"
                                    Rows="7" Columns="40" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="LinkButtonCloseError" OnClick="LinkButtonCloseError_Click" runat="server">Close</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" width="100%">
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
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToCSV" runat="server" OnClick="LinkButtonExportToCSV_Click">
                                        <span>
                                            <asp:Image ID="ImageExportToCSV" runat="server" ImageUrl="App_Themes/Blue/images/csv.png" />Export
                                            CSV</span></asp:LinkButton>
                                </li>
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
                        <table width="100%">
                            <tr>
                                <td valign="top">
                                    <%--<asp:GridView ID="GridView1" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False"
                                        OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Alarm" HeaderText="Alarm" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Time" HeaderText="Time" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Value" HeaderText="Value" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:GridView>--%>
                                    <asp:GridView ID="GridViewAlarmHistorical" SkinID="GridViewDefaultSkin" runat="server"
                                        AutoGenerateColumns="False" OnPageIndexChanging="GridViewAlarmHistorical_PageIndexChanging"
                                        Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                            <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Time Activated" />
                                            <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Activated Value" />
                                            <asp:BoundField DataField="Status" ItemStyle-HorizontalAlign="Center" HeaderText="Time Deactivated" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="GridViewAlarmsCurrent" SkinID="GridViewDefaultSkin" runat="server"
                                        AutoGenerateColumns="False" OnPageIndexChanging="GridViewAlarmsCurrent_PageIndexChanging"
                                        Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Alarm" ItemStyle-HorizontalAlign="Center" HeaderText="Alarm" />
                                            <asp:BoundField DataField="Activated" ItemStyle-HorizontalAlign="Center" HeaderText="Time Activated" />
                                            <asp:BoundField DataField="ActivatedValue" ItemStyle-HorizontalAlign="Center" HeaderText="Activated Value" />
                                            <asp:BoundField DataField="CurrentValue" ItemStyle-HorizontalAlign="Center" HeaderText="Current Value" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="GridView2" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="ID" OnPageIndexChanging="GridView2_PageIndexChanging" AllowPaging="true"
                                        PageSize="15" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Edit" Visible="false" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%# Bind("ID") %>'
                                                        OnClick="LinkButtonEdit_Click">Edit</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="LoLo" HeaderText="LoLo" SortExpression="LoLo" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Lo" HeaderText="Lo" SortExpression="Lo" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Hi" HeaderText="Hi" SortExpression="Hi" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="HiHi" HeaderText="HiHi" SortExpression="HiHi" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Setpoint" HeaderText="Setpoint" SortExpression="Setpoint"
                                                ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Percentage" HeaderText="%" SortExpression="Percentage"
                                                ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Expression" HeaderText="Alarm On" SortExpression="Expression"
                                                ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:GridView>
                                    <input type="hidden" id="HiddenFieldTagsSelected" name="HiddenFieldTagsSelected"
                                        runat="server" />
                                </td>
                                <td valign="top">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="LinkButtonExportToWord" />
            <asp:PostBackTrigger ControlID="LinkButtonExportToExcel" />
            <asp:PostBackTrigger ControlID="LinkButtonExportToPDF" />
            <asp:PostBackTrigger ControlID="LinkButtonExportToCSV" />
        </Triggers>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenButton"
        PopupControlID="Panel1" CancelControlID="HiddenButton" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="HiddenButton" runat="Server" Style="display: none" />
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td valign="top">
                            <asp:Panel ID="PanelAlarmViewType" CssClass="GroupBox" GroupingText="View Alarm"
                                runat="server">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButtonList ID="RadioButtonListAlarmView" RepeatDirection="Horizontal" AutoPostBack="true"
                                                            runat="server" OnSelectedIndexChanged="RadioButtonListAlarmView_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="History" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Currently Active"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="Settings"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
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
                            <asp:LinkButton ID="LinkButtonDisplay" OnClientClick="DisplayProgress()" OnClick="LinkButtonDisplay_Click"
                                AutoPostback="true" runat="server">Display</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" OnClick="LinkButtonCancel_Click" AutoPostback="true"
                                runat="server">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderNoTagsFound" runat="server" TargetControlID="Button2"
        PopupControlID="PanelNoTags" CancelControlID="Button2" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="Button2" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelNoTags" runat="server" CssClass="modalPopup" Style="display: none"
        ScrollBars="Vertical" Height="200px">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td align="right">
                            <asp:LinkButton ID="LinkButtonClose" OnClick="LinkButtonClose_Click" runat="server">Close</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Repeater ID="RepeaterNoTag" runat="server">
                                <HeaderTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <b>Warning</b>
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
                            <asp:Repeater ID="RepeaterNoReading" runat="server">
                                <HeaderTemplate>
                                    <table>
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
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button1"
        PopupControlID="PanelEditAlarm" CancelControlID="Button1" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="Button1" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelEditAlarm" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <table border="0">
                    <tr>
                        <td valign="top" style="width: 125px">
                            <asp:RadioButton ID="RadioButtonHiLoEdit" runat="server" Text="Range Alarms" GroupName="Alarm">
                            </asp:RadioButton>
                        </td>
                        <td>
                            <table border="0">
                                <tr>
                                    <td style="width: 50px">
                                        <asp:CheckBox ID="CheckBoxLoLoEdit" runat="server" />
                                        LoLo
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxLoLoEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="TextBoxLoLoEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:HiddenField ID="HiddenFieldLoLoEdit" runat="server" />
                                    </td>
                                    <td style="width: 45px">
                                        <asp:CheckBox ID="CheckBoxLoEdit" runat="server" />
                                        Lo
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxLoEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="TextBoxLoEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:HiddenField ID="HiddenFieldLoEdit" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50px">
                                        <asp:CheckBox ID="CheckBoxHiEdit" runat="server" />
                                        Hi
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxHiEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="TextBoxHiEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:HiddenField ID="HiddenFieldHiEdit" runat="server" />
                                    </td>
                                    <td style="width: 45px">
                                        <asp:CheckBox ID="CheckBoxHiHiEdit" runat="server" />
                                        HiHi
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxHiHiEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="TextBoxHiHiEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:HiddenField ID="HiddenFieldHiHiEdit" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:RadioButton ID="RadioButtonSetPointPercentageEdit" runat="server" Text="Midpoint (%)"
                                GroupName="Alarm"></asp:RadioButton>
                        </td>
                        <td>
                            <table border="0">
                                <tr>
                                    <td style="width: 50px">
                                        Setpoint
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxSetpointPercentageEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" TargetControlID="TextBoxSetpointPercentageEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 45px; text-align: center">
                                        +/-
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxPercentageEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" TargetControlID="TextBoxPercentageEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                        %
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:RadioButton ID="RadioButtonSetPointValueEdit" runat="server" Text="Midpoint (value)"
                                GroupName="Alarm"></asp:RadioButton>
                        </td>
                        <td>
                            <table border="0">
                                <tr>
                                    <td style="width: 50px">
                                        Setpoint
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxSetpointValueEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" TargetControlID="TextBoxSetpointValueEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 45px; text-align: center">
                                        +/-
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxValueEdit" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" TargetControlID="TextBoxValueEdit"
                                            FilterType="Numbers, Custom" ValidChars="., -">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:HiddenField ID="HiddenFieldID" runat="server" />
                            <asp:HiddenField ID="HiddenFieldName" runat="server" />
                            <asp:HiddenField ID="HiddenFieldAlarmType" runat="server" />
                            <asp:LinkButton ID="LinkButtonSaveEdit" OnClientClick="return SaveModal();" runat="server"
                                ValidationGroup="1" OnClick="LinkButtonSaveEdit_Click">Save</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancelEdit" OnClick="LinkButtonCancelEdit_Click" runat="server">Cancel</asp:LinkButton>
                            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="1" HeaderText="You must enter a valid value in the following fields"
                                ShowMessageBox="true" ShowSummary="false" runat="server" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Button3"
        PopupControlID="PanelAlarmStatusModal" CancelControlID="Button3" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Button ID="Button3" runat="Server" Style="display: none" />
    <asp:Panel ID="PanelAlarmStatusModal" runat="server" CssClass="modalPopup" Style="display: none">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <table border="0" width="100%">
                    <tr>
                        <td>
                            Alarm triggered when status is
                            <asp:DropDownList ID="DropDownListAlarmStatusModal" SkinID="DropDownListDefaultSkin"
                                runat="server">
                                <asp:ListItem Text="True"></asp:ListItem>
                                <asp:ListItem Text="False"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:LinkButton ID="LinkButtonSaveStatus" runat="server" ValidationGroup="1" OnClick="LinkButtonSaveStatus_Click">Save</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCloseStatus" OnClick="LinkButtonCloseStatus_Click"
                                runat="server">Cancel</asp:LinkButton>
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
</asp:Content>
