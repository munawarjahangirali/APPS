<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="Summary, App_Web_nvkiirpv" theme="Grey" %>

<%@ MasterType VirtualPath="MasterPageAlarms.master" %>
<%@ Register TagPrefix="cc" Namespace="CoolControls.GooglePack.Maps" Assembly="CoolControls.GooglePack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table style="width: 100%;">
        <tr>
            <td rowspan="2" style="width:50%;">
                <asp:Panel ID="Panel1" ScrollBars="Vertical" runat="server">
                    <table width="100%" border="0">
                        <tr>                            
                            <td>
                                <asp:Table ID="TableFacilityInfo" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                CssClass="gridviewheader" CellPadding="5" CellSpacing="5" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="Both" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                    <asp:TableRow>
                                        <asp:TableCell Text="Name" Width="40%" Font-Bold="true"></asp:TableCell>
                                        <asp:TableCell ID="Name" Width="60%"></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell Text="Latitiude/Longitude" Width="40%" Font-Bold="true"></asp:TableCell>
                                        <asp:TableCell ID="LatLong" Width="60%"></asp:TableCell>
                                    </asp:TableRow>
                                 </asp:Table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Table ID="Table1" runat="server" Width="100%">
                                    <asp:TableRow>                               
                                        <asp:TableCell BorderStyle="None" ID="TableCell1" BackColor="WhiteSmoke"></asp:TableCell> 
                                        <asp:TableCell BorderStyle="None" ID="TableCell2" BackColor="WhiteSmoke"></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>                               
                                        <asp:TableCell BorderStyle="None" ID="TableCell3" BackColor="WhiteSmoke"></asp:TableCell> 
                                        <asp:TableCell BorderStyle="None" ID="TableCell4" BackColor="WhiteSmoke"></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Table ID="TableFacilityProperties" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                CssClass="gridviewheader" CellPadding="5" CellSpacing="5" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="Both" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                
                                </asp:Table>                                
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>           
            <td rowspan="3" valign="top">
                <asp:Panel ID="Panel2" ScrollBars="Vertical" runat="server">
                    <table width="100%" border="0">
                        <asp:DropDownList ID="DropDownListTagTypes" SkinID="DropDownListDefaultSkin" runat="server" 
                            onselectedindexchanged="DropDownListTagTypes_SelectedIndexChanged"  AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click1" Font-Underline="true">View Plot</asp:LinkButton>
                        <tr>                            
                            <td colspan="2">
                                <asp:GridView ID="GridView1" SkinID="GridViewDefaultSkin" runat="server" AutoGenerateColumns="False" 
                                OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True"
                                    PageSize="5">
                                <PagerSettings Position="Bottom" FirstPageText="Frist" 
                                        LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" 
                                        NextPageImageUrl="~/images/Next.jpg" 
                                        PreviousPageImageUrl="~/images/Previous.jpg" />                                
                                <Columns>
                                <asp:BoundField DataField="Tag" ItemStyle-HorizontalAlign="Center" HeaderText="Tag" SortExpression="Tag" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" ItemStyle-HorizontalAlign="Center" HeaderText="Description" SortExpression="Description" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Time" ItemStyle-HorizontalAlign="Center" HeaderText="Time" SortExpression="Time" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="Value" ItemStyle-HorizontalAlign="Center" HeaderText="Value" SortExpression="Value" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                </Columns>
                                </asp:GridView>                                
                            </td>
                            <td>                               
                                
                            </td>
                        </tr>                        
                    </table>
                </asp:Panel>
            </td>                        
        </tr>
        <tr>
            <td>        
            </td>
            
            <td>          
            </td>
        </tr>        
        <tr>
            <td>
                <div style="float:left;">
                <cc:GoogleMapsViewer runat="server" ID="googleMapsViewer"
                                    MapControl="LargeMap3D"
                                    MapTypeSwitch="Cool"
                                    ZoomToBounds="true" 
                                    EnableAutoZoomOut="true"
                                    ShowOverviewMap="true"
                                    Height="400px" 
                                    Width="600px"
                                    EnableScrollWheelZoom="True" 
                                    MapType="Satellite"/>                                        
                </div>
            </td>
            <td>
        
            </td>
        </tr>
    </table>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

