<%@ control language="C#" autoeventwireup="true" inherits="SettingsConfiguration, App_Web_q1bp2ybq" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<cc1:ModalPopupExtender ID="ModalPopupExtenderError" runat="server" CancelControlID="HiddenButtonError"
    TargetControlID="HiddenButtonError" PopupControlID="PanelErrorHandler" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>

<script type="text/javascript">
    function clientValidate(sender, args) {
        var c = parseFloat(args.Value);
        document.getElementById('<%=TextBoxVariance.ClientID %>').value = c;
        
//        }
    }

    function clientValidate2(sender, args) {
        var c = parseFloat(args.Value);
        if (c < 0 || c > 100) {
            alert("Offset out of range");
            document.getElementById('<%=TextBoxDailyOffSet.ClientID %>').value = "";
            
        } else {
            document.getElementById('<%=TextBoxDailyOffSet.ClientID %>').value = c;
          
        }
        

        //        }
    }  

    function pageLoad(sender, e) {
        $find("FilteredTextBoxExtender1").add_filtered(function() {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender2").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender3").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender4").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender5").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender6").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender7").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender8").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender9").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender10").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender11").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender12").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender13").add_filtered(function () {
            alert("Invalid character detected");
        });

        $find("FilteredTextBoxExtender14").add_filtered(function () {
            alert("Invalid character detected");
        });

        

     //   var txt1 = document.getElementById("<%= TextBoxVariance.ClientID %>");
        //      alert(txt1);
    }

</script>
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
<table border="0" width="700px">
    <tr>
        <td valign="top">
            <asp:Panel ID="PanelSettings" runat="server" GroupingText="ZDV WebStudio" CssClass="Panel">
                <table width="80%">
                    <tr align="left">
                        <td>
                            System Timer:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxSystemTimer" Text="30" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            secs
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBoxSystemTimer"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="System Timer">*</asp:RequiredFieldValidator>
                                
                                <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender1" ID ="FilteredTextBoxExtender1" TargetControlID="TextBoxSystemTimer"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            No Reading Display Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNoReadingLimit" Text="30" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            mins
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBoxNoReadingLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="No Reading Limit">*</asp:RequiredFieldValidator>
                        
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender2" ID ="FilteredTextBoxExtender2" TargetControlID="TextBoxNoReadingLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Dashboard Display For Last:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDashboardPeriod" Text="1" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            hours
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBoxDashboardPeriod"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Dashboard Display For Last">*</asp:RequiredFieldValidator>
                        
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender3" ID ="FilteredTextBoxExtender3" TargetControlID="TextBoxDashboardPeriod"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Transmitter Functionality:
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxTransmitterFunctionality" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Email Error:
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxEmailError" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            Use Aggregate Tables:
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxUseAggregateTables" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td valign="top">
            <asp:Panel ID="Panel2" runat="server" GroupingText="ZDV Aggregation" CssClass="Panel">
                <table width="95%" border="0">
                    <tr align="left">
                        <td>
                            Aggregation Time:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxAggregationTime" Text="00:00:00" runat="server" SkinID="TextBoxDefaultSkin55"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtenderStartFromTime" runat="server" TargetControlID="TextBoxAggregationTime" 
                                Mask="99:99:99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" InputDirection="RightToLeft"
                                OnInvalidCssClass="MaskedEditError" ClearTextOnInvalid="True" MaskType="Time" AcceptAMPM="False" ErrorTooltipEnabled="True">
                            </cc1:MaskedEditExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBoxAggregationTime" 
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Aggregation Time"> *</asp:RequiredFieldValidator>
                        <cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server" ControlExtender="MaskedEditExtenderStartFromTime"
                        ControlToValidate="TextBoxAggregationTime" IsValidEmpty="false" MaximumValue="23:59:59" MinimumValue="00:00:00"
                        EmptyValueMessage="Enter Time" MaximumValueMessage="23:59:59" InvalidValueBlurredMessage="Time is Invalid"
                        MinimumValueMessage="Time must be greater than 00:00:00" EmptyValueBlurredText="*"
                        ToolTip="Enter time between 00:00:00 to 23:59:59"></cc1:MaskedEditValidator>
                       
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Day Start:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDayStart" Text="00:00:00" runat="server" SkinID="TextBoxDefaultSkin55"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" ClearTextOnInvalid="True" runat="server" TargetControlID="TextBoxDayStart"
                                Mask="99:99:99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" 
                                OnInvalidCssClass="MaskedEditError" MaskType="Time" AcceptAMPM="False" ErrorTooltipEnabled="True">
                            </cc1:MaskedEditExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBoxDayStart"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Day Start">*</asp:RequiredFieldValidator>
                          
                          <cc1:MaskedEditValidator ID="MaskedEditValidator1" runat="server" ControlExtender="MaskedEditExtender1"
                        ControlToValidate="TextBoxDayStart" IsValidEmpty="false" MaximumValue="23:59:59" MinimumValue="00:00:00"
                        EmptyValueMessage="Enter Time" MaximumValueMessage="23:59:59" InvalidValueBlurredMessage="Time is Invalid"
                        MinimumValueMessage="Time must be greater than 00:00:00" EmptyValueBlurredText="*"
                        ToolTip="Enter time between 00:00:00 to 23:59:59"></cc1:MaskedEditValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Daily Offset:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDailyOffSet" Text="0" runat="server" SkinID="TextBoxDefaultSkin20"></asp:TextBox>&nbsp;%
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBoxDailyOffSet"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Daily Offset">*</asp:RequiredFieldValidator>
                                
                                 <cc1:FilteredTextBoxExtender runat="server"  BehaviorID="FilteredTextBoxExtender14" ID ="FilteredTextBoxExtender14" TargetControlID="TextBoxDailyOffSet"
                              FilterType="Numbers, Custom" ValidChars="'.'"/>
                             
                             <asp:CustomValidator runat="server" ID="CustomValidator2" ControlToValidate="TextBoxDailyOffSet" ClientValidationFunction="clientValidate2" Display="Dynamic"> </asp:CustomValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Commissioning Date:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCommissioningDate" ReadOnly="True" Text="01/01/2011" runat="server" SkinID="TextBoxDefaultSkin75"></asp:TextBox>
                            <asp:ImageButton runat="Server" ID="ImageCalendarCommissioningDate" ImageUrl="~/images/calendar.png"
                                AlternateText="Click to show calendar" />
                            <cc1:CalendarExtender ID="CalendarExtenderStartFromDate" Format="dd/MM/yyyy" runat="server"
                                TargetControlID="TextBoxCommissioningDate" PopupButtonID="ImageCalendarCommissioningDate">
                            </cc1:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="TextBoxCommissioningDate"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Commissioning Date">*</asp:RequiredFieldValidator>
                       
                      
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <asp:Panel ID="Panel5" runat="server" GroupingText="Plot Limits" CssClass="Panel">
                <table width="95%" border="0">
                    <tr align="left">
                        <td>
                            Real-Time Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxRealTimeLimit" Text="3" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="TextBoxRealTimeLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Real-Time Limit">*</asp:RequiredFieldValidator>
                        
                         <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender4" ID ="FilteredTextBoxExtender4" TargetControlID="TextBoxRealTimeLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Filter Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxFilteredLimit" Text="30" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="TextBoxFilteredLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Filter Limit">*</asp:RequiredFieldValidator>
                        
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender5" ID ="FilteredTextBoxExtender5" TargetControlID="TextBoxFilteredLimit"
                                FilterType="Numbers"/>
                        
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Hourly Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxHourlyLimit" Text="60" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="TextBoxHourlyLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Hourly Limit">*</asp:RequiredFieldValidator>
                       
                       
                       <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender6" ID ="FilteredTextBoxExtender6" TargetControlID="TextBoxHourlyLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td valign="top">
            <asp:Panel ID="Panel3" runat="server" GroupingText="Plot Data Reduction Methods"
                CssClass="Panel">
                <table width="77%" border="0">
                    <tr align="left">
                        <td>
                            Number of Passes:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNumPasses" Text="1" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TextBoxNumPasses"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Number of Passes">*</asp:RequiredFieldValidator>
                                
                            <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender11" ID ="FilteredTextBoxExtender11" TargetControlID="TextBoxNumPasses"
                                                         FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Variance:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxVariance" Text="0.01" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="TextBoxVariance"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Variance">*</asp:RequiredFieldValidator>
                           
                             <cc1:FilteredTextBoxExtender runat="server"  BehaviorID="FilteredTextBoxExtender13" ID ="FilteredTextBoxExtender13" TargetControlID="TextBoxVariance"
                              FilterType="Numbers, Custom" ValidChars="'.'"/>
                             
                             <asp:CustomValidator runat="server" ID="CustomValidator1" ControlToValidate="TextBoxVariance" ClientValidationFunction="clientValidate" Display="Dynamic"> </asp:CustomValidator>
                             
                               
                         
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Number of Points:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNumPoints" Text="10" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="TextBoxNumPoints"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Number of Points">*</asp:RequiredFieldValidator>
                        
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender12" ID ="FilteredTextBoxExtender12" TargetControlID="TextBoxNumPoints"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <asp:Panel ID="Panel6" runat="server" GroupingText="Data Limits" CssClass="Panel">
                <table width="95%" border="0">
                    <tr align="left">
                        <td>
                            Real-Time Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDataRealTimeLimit" Text="3" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="TextBoxDataRealTimeLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Real-Time Limit">*</asp:RequiredFieldValidator>
                        
                         <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender7" ID ="FilteredTextBoxExtender7" TargetControlID="TextBoxDataRealTimeLimit"
                                FilterType="Numbers"/>
                        
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Hourly Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDataHourlyLimit" Text="60" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="TextBoxDataHourlyLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Hourly Limit">*</asp:RequiredFieldValidator>
                                            
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender8" ID ="FilteredTextBoxExtender8" TargetControlID="TextBoxDataHourlyLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td valign="top">
            <asp:Panel ID="Panel7" runat="server" GroupingText="Report Limits" CssClass="Panel">
                <table width="95%" border="0">
                    <tr align="left">
                        <td>
                            Real-Time Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxReportRealTimeLimit" Text="3" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="TextBoxReportRealTimeLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Real-Time Limit">*</asp:RequiredFieldValidator>
                       
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender9" ID ="FilteredTextBoxExtender9" TargetControlID="TextBoxReportRealTimeLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Hourly Limit:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxReportHourlyLimit" Text="60" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                            days
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="TextBoxReportHourlyLimit"
                                ValidationGroup="Configuration" runat="server" SetFocusOnError="true" ErrorMessage="Hourly Limit">*</asp:RequiredFieldValidator>
                        
                        <cc1:FilteredTextBoxExtender runat="server" BehaviorID="FilteredTextBoxExtender10" ID ="FilteredTextBoxExtender10" TargetControlID="TextBoxReportHourlyLimit"
                                FilterType="Numbers"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <asp:HiddenField ID="HiddenFieldConfigurationID" runat="server" />
            <asp:HiddenField ID="HiddenFieldStdDevReductionID" runat="server" />
            <asp:LinkButton ID="LinkButtonSaveSettings" Text="Save" runat="server" ValidationGroup="Configuration"
                OnClick="LinkButtonSaveSettings_Click"></asp:LinkButton>
          <%--  <asp:ValidationSummary ID="ValidationSummaryConfiguration" ValidationGroup="Configuration"
                HeaderText="" ShowMessageBox="true" ShowSummary="false" runat="server" />--%>
        </td>
    </tr>
</table>
