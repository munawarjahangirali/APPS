<%@ control language="C#" autoeventwireup="true" inherits="SettingsTimePeriod, App_Web_q1bp2ybq" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script type="text/javascript">
    function RadioSelectionForLast() {
        if (!document.getElementById('<%= RadioButtonForLast.ClientID %>').checked) {
            var RadioButtonForLast = document.getElementById('<%= RadioButtonForLast.ClientID %>');
            RadioButtonForLast.checked = true;
        }
    }

    function RadioSelectionStartFrom() {
        if (!document.getElementById('<%= RadioButtonStartFrom.ClientID %>').checked) {
            var RadioButtonStartFrom = document.getElementById('<%= RadioButtonStartFrom.ClientID %>');
            RadioButtonStartFrom.checked = true;
        }
    }

    function RadioSelectionCustom() {
        if (!document.getElementById('<%= RadioButtonCustom.ClientID %>').checked) {
            var RadioButtonCustom = document.getElementById('<%= RadioButtonCustom.ClientID %>');
            RadioButtonCustom.checked = true;
        }
    }

    function FocusForLast() {
        var TextBoxLastDuration = document.getElementById('<%= TextBoxLastDuration.ClientID %>');
        TextBoxLastDuration.focus();
    }

    function FocusStartFrom() {
        var TextBoxStartFromDate = document.getElementById('<%= TextBoxStartFromDate.ClientID %>');
        TextBoxStartFromDate.focus();
    }

    function FocusCustom() {
        var TextBoxCustomDateFrom = document.getElementById('<%= TextBoxCustomDateFrom.ClientID %>');
        TextBoxCustomDateFrom.focus();
    }
</script>

<asp:Panel ID="PanelTimePeriod" CssClass="GroupBox" GroupingText="Time Period" Width="500px"
    runat="server">
    <table border="0">
        <tr>
            <td align="left">
                <asp:RadioButton ID="RadioButtonForLast" runat="server" Text="For Last" Checked="True"
                    GroupName="Time"></asp:RadioButton>
            </td>
            <td align="left">
                <asp:TextBox ID="TextBoxLastDuration" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderLastDuration" runat="server"
                    TargetControlID="TextBoxLastDuration" FilterType="Numbers" >
                </cc1:FilteredTextBoxExtender>
                <asp:DropDownList ID="DropDownListLastFrequency" runat="server" SkinID="DropDownListDefaultSkin">
                    <%--<asp:ListItem Value="0">Minutes</asp:ListItem>
                    <asp:ListItem Value="1">Hour(s)</asp:ListItem>
                    <asp:ListItem Value="2">Day(s)</asp:ListItem>
                    <asp:ListItem Value="3">Week(s)</asp:ListItem>
                    <asp:ListItem Value="4">Month(s)</asp:ListItem>--%>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:RadioButton ID="RadioButtonStartFrom" runat="server" Text="Start From" GroupName="Time">
                </asp:RadioButton>
            </td>
            <td align="left">
                <asp:TextBox ID="TextBoxStartFromDate" runat="server" SkinID="TextBoxDefaultSkin75" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton runat="Server" ID="ImageCalendarStartFromDate" ImageUrl="~/images/calendar.png"
                    AlternateText="Click to show calendar" />
                <cc1:CalendarExtender ID="CalendarExtenderStartFromDate" Format="dd/MM/yyyy" runat="server"
                    TargetControlID="TextBoxStartFromDate" PopupButtonID="ImageCalendarStartFromDate">
                </cc1:CalendarExtender>
                <%--<asp:RangeValidator ID="RangeValidatorStartFromDate" runat="server" ErrorMessage="Out of range" ControlToValidate="TextBoxStartFromDate" Type="Date"></asp:RangeValidator>--%>
                <asp:TextBox ID="TextBoxStartFromTime" Text="00:00" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                <cc1:MaskedEditExtender ID="MaskedEditExtenderStartFromTime" runat="server" TargetControlID="TextBoxStartFromTime"
                    Mask="99:99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                    MaskType="Time" AcceptAMPM="False" ErrorTooltipEnabled="True">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatorStartFromTime" ControlExtender="MaskedEditExtenderStartFromTime"
                    ControlToValidate="TextBoxStartFromTime" IsValidEmpty="False" EmptyValueMessage="Time is required"
                    InvalidValueMessage="Time is invalid" Display="Dynamic" TooltipMessage="Input a time"
                    EmptyValueBlurredText="*" InvalidValueBlurredMessage="*" ValidationGroup="1"
                    runat="server"></cc1:MaskedEditValidator>
                for
                <asp:TextBox ID="TextBoxStartFromDuration" SkinID="TextBoxDefaultSkin40" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderStartFromDuration" runat="server"
                    TargetControlID="TextBoxStartFromDuration" FilterType="Numbers" >
                </cc1:FilteredTextBoxExtender>
                <asp:DropDownList ID="DropDownListStartFromFrequency" SkinID="DropDownListDefaultSkin"
                    runat="server">
                    <%--<asp:ListItem Value="0">Minutes</asp:ListItem>
                    <asp:ListItem Value="1">Hour(s)</asp:ListItem>
                    <asp:ListItem Value="2">Day(s)</asp:ListItem>
                    <asp:ListItem Value="3">Week(s)</asp:ListItem>
                    <asp:ListItem Value="4">Month(s)</asp:ListItem>--%>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStartFromDate" ControlToValidate="TextBoxStartFromDate"
                    ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Date">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:RadioButton ID="RadioButtonCustom" runat="server" Text="Custom From" GroupName="Time">
                </asp:RadioButton>
            </td>
            <td>
                <asp:TextBox ID="TextBoxCustomDateFrom" runat="server" SkinID="TextBoxDefaultSkin75"
                    OnTextChanged="TextBoxCustomDateFrom_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:ImageButton runat="Server" ID="ImageButtonCustomDateFrom" ImageUrl="~/images/calendar.png"
                    AlternateText="Click to show calendar" />
                <cc1:CalendarExtender ID="CalendarExtenderCustomDateFrom" Format="dd/MM/yyyy" runat="server"
                    TargetControlID="TextBoxCustomDateFrom" PopupButtonID="ImageButtonCustomDateFrom">
                </cc1:CalendarExtender>
                <asp:TextBox ID="TextBoxCustomTimeFrom" Text="00:00" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                <cc1:MaskedEditExtender ID="MaskedEditExtenderCustomTimeFrom" runat="server" TargetControlID="TextBoxCustomTimeFrom"
                    Mask="99:99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                    MaskType="Time" AcceptAMPM="False" ErrorTooltipEnabled="True">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatorCustomTimeFrom" ControlExtender="MaskedEditExtenderCustomTimeFrom"
                    ControlToValidate="TextBoxCustomTimeFrom" IsValidEmpty="False" EmptyValueMessage="Time is required"
                    InvalidValueMessage="Time is invalid" Display="Dynamic" TooltipMessage="Input a time"
                    EmptyValueBlurredText="*" InvalidValueBlurredMessage="*" ValidationGroup="1"
                    runat="server"></cc1:MaskedEditValidator>
                to
                <asp:TextBox ID="TextBoxCustomDateTo" runat="server" SkinID="TextBoxDefaultSkin75"
                    OnTextChanged="TextBoxCustomDateTo_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:ImageButton runat="Server" ID="ImageButtonCustomDateTo" ImageUrl="~/images/calendar.png"
                    AlternateText="Click to show calendar" />
                <cc1:CalendarExtender ID="CalendarExtenderCustomDateTo" Format="dd/MM/yyyy" runat="server"
                    TargetControlID="TextBoxCustomDateTo" PopupButtonID="ImageButtonCustomDateTo">
                </cc1:CalendarExtender>
                <asp:TextBox ID="TextBoxCustomTimeTo" Text="23:59" runat="server" SkinID="TextBoxDefaultSkin40"></asp:TextBox>
                <cc1:MaskedEditExtender ID="MaskedEditExtenderCustomTimeTo" runat="server" TargetControlID="TextBoxCustomTimeTo"
                    Mask="99:99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                    MaskType="Time" AcceptAMPM="False" ErrorTooltipEnabled="True">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatorCustomTimeTo" ControlExtender="MaskedEditExtenderCustomTimeTo"
                    ControlToValidate="TextBoxCustomTimeTo" IsValidEmpty="False" EmptyValueMessage="Time is required"
                    InvalidValueMessage="Time is invalid" Display="Dynamic" TooltipMessage="Input a time"
                    EmptyValueBlurredText="*" InvalidValueBlurredMessage="*" ValidationGroup="1"
                    runat="server"></cc1:MaskedEditValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCustomDateFrom" ControlToValidate="TextBoxCustomDateFrom"
                    ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Date">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCustomDateTo" ControlToValidate="TextBoxCustomDateTo"
                    ValidationGroup="1" runat="server" SetFocusOnError="true" ErrorMessage="Date">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <asp:HiddenField ID="HiddenFieldStartDate" runat="server" />
        <asp:HiddenField ID="HiddenFieldEndDate" runat="server" />
    </table>
    
</asp:Panel>
