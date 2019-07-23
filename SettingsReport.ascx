<%@ control language="C#" autoeventwireup="true" inherits="SettingsReport, App_Web_q1bp2ybq" %>
<asp:Panel ID="PanelReport" CssClass="GroupBox" GroupingText="Report" runat="server">
    <table border="0" style="text-align: left">
        <tr>
            <td width="96px">
                Title
            </td>
            <td>
                <asp:TextBox ID="TextBoxReportTitle" SkinID="TextBoxDefaultSkin330" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Type
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonListReportType" RepeatDirection="Horizontal"
                    runat="server" onselectedindexchanged="RadioButtonListReportType_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="Realtime" Text="Real-time" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Aggregated" Text="Aggregated"></asp:ListItem>
                    <asp:ListItem Value="Alarms" Text="Alarms"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelAggregation" Visible="false" runat="server" Text="Aggregate Every"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxAggregationDuration" Visible="false" SkinID="TextBoxDefaultSkin40" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownListAggregationPeriod" Visible="false" SkinID="DropDownListDefaultSkin" runat="server">
                    <asp:ListItem Value="Hour" Text="Hour(s)" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Day" Text="Day(s)"></asp:ListItem>
                    <asp:ListItem Value="Week" Text="Week(s)"></asp:ListItem>
                    <asp:ListItem Value="Month" Text="Month(s)"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelAggregationInclude" Visible="false" runat="server" Text="Include"></asp:Label>
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxListAggregationInclude" RepeatDirection="Horizontal" Visible="false"
                    runat="server">
                    <asp:ListItem Value="Min" Text="Min" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Max" Text="Max" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Average" Text="Average" Selected="True" Enabled="false"></asp:ListItem>
                    <asp:ListItem Value="StdDev" Text="StdDev" Selected="True"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
    </table>
</asp:Panel>
