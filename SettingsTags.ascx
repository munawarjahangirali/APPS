<%@ control language="C#" autoeventwireup="true" inherits="SettingsTags, App_Web_q1bp2ybq" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script src="Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/CheckList/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
<script src="js/CheckList/ui.dropdownchecklist.js" type="text/javascript"></script>
<link href="js/CheckList/ui.dropdownchecklist.standalone.css" rel="stylesheet" type="text/css" />
<link href="App_Themes/ZDVStyleSheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(document).ready(function () {

        ////////////Populating TagType DropDownCheckList/////////////    
        
    });
</script>



<asp:Panel ID="PanelTags" CssClass="GroupBox" GroupingText="" runat="server"
    Height="400px">
    <asp:Panel ID="PanelTagtypes" CssClass="GroupBox" GroupingText="Tag Types" runat="server"
    ScrollBars="Vertical" Height="75px">
    <asp:CheckBoxList ID="CheckBoxListTypes" runat="server" AutoPostBack="true"  
        OnSelectedIndexChanged="CheckBoxListTypes_SelectedIndexChanged" 
        RepeatColumns="3" RepeatDirection="Horizontal" Height="50px">        
    </asp:CheckBoxList>    
    </asp:Panel>
    <asp:DropDownList ID="DropDownListTypes" Visible="false" SkinID="DropDownListDefaultSkin" runat="server"
        OnSelectedIndexChanged="DropDownListTypes_SelectedIndexChanged" AutoPostBack="true">
    </asp:DropDownList>
    <asp:Panel ID="PanelGridViewTags" CssClass="GroupBox" GroupingText="Tags" runat="server"
    ScrollBars="Vertical" Height="325px">
    <asp:GridView ID="GridViewTags" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False"
        Width="100%" DataKeyNames="ID" AllowSorting="True"
        OnSortCommand="GridViewTags_SortCommand" onsorting="GridViewTags_Sorting"
        SortedAscendingHeaderStyle-CssClass="sortasc-header" SortedDescendingHeaderStyle-CssClass="sortdesc-header">
        <Columns>
            <asp:TemplateField HeaderText="Include" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <asp:CheckBox runat="server" ID="HeaderLevelCheckBox" OnCheckedChanged="HeaderLevelCheckBox_CheckedChanged"
                        AutoPostBack="true" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxInclude" runat="server" Checked='<%# Eval("Include").ToString() == "True" ? true : false %>'/>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="NAME" ItemStyle-HorizontalAlign="Center" HeaderText="Tag"
                SortExpression="NAME" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="Type"
                SortExpression="TYPE" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UNIT" Visible="true" ItemStyle-HorizontalAlign="Center"
                HeaderText="Unit" ReadOnly="True" SortExpression="UNIT" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="FACILITYNAME" ItemStyle-HorizontalAlign="Center" HeaderText="Facility"
                SortExpression="FACILITYNAME" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <%--<asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>--%>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UNIT_TYPE_ID" Visible="false" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="LabelUnitTypeID" runat="server" Text='<%# Bind("UNIT_TYPE_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATA_TYPE" Visible="false" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="LabelDataType" runat="server" Text='<%# Bind("DATA_TYPE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="STATUS_GREEN" Visible="false" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="LabelStatusGreen" runat="server" Text='<%# Bind("STATUS_GREEN") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DECIMAL_PLACES" Visible="false" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="LabelDecimalPlaces" runat="server" Text='<%# Bind("DECIMAL_PLACES") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GENERIC_TYPE" Visible="false" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="LabelGenericType" runat="server" Text='<%# Bind("GENERIC_TYPE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>                    
                    <asp:Label id="DATASOURCE" runat ="server" text='<%# Eval("DATASOURCE")%>'> </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
        </Columns>
        <SortedAscendingHeaderStyle CssClass="sortasc-header" />
        <SortedDescendingHeaderStyle CssClass="sortdesc-header" />
    </asp:GridView>
    </asp:Panel>
    <br />
    
    <asp:DropDownList ID="DropDownListTypesFacility" SkinID="DropDownListDefaultSkin"
        runat="server" OnSelectedIndexChanged="DropDownListTypesFacility_SelectedIndexChanged"
        AutoPostBack="true">
    </asp:DropDownList>
    <br />
    <asp:GridView ID="GridViewFacilities" SkinID="GridViewDefaultSkin" runat="server"
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:TemplateField HeaderText="Include" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <asp:CheckBox runat="server" ID="HeaderLevelCheckBoxFacilities" OnCheckedChanged="HeaderLevelCheckBoxFacilities_CheckedChanged"
                        AutoPostBack="true" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxIncludeFacility" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NAME" HeaderText="Tag" SortExpression="NAME" />
            <asp:BoundField DataField="TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="Type"
                SortExpression="TYPE" />
            <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False"
                ReadOnly="True" SortExpression="ID" />
        </Columns>
    </asp:GridView>
</asp:Panel>
