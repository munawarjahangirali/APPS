<%@ page title="" language="C#" masterpagefile="~/MasterPageAlarms.master" autoeventwireup="true" inherits="ESPWellMonitor, App_Web_nvkiirpv" theme="Grey" %>

<%@ Register Assembly="DundasWebChart" Namespace="Dundas.Charting.WebControl" TagPrefix="DCWC" %>

<%@ MasterType VirtualPath="~/MasterPageAlarms.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="Panel2" runat="server">
            <table border="0" width="100%">
                <tr>
                    <td style="width: 20%; max-width:20%" valign="top">
                        <asp:Image ID="Image1" Height="908px" runat="server" ImageUrl="~/images/ESP.png" />
                    </td>
                    <td style="width: 40%" valign="top">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="labelESPFacilityName" runat="server" Text="Demo Well 1" Font-Bold="true" Font-Size="Large"></asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableSurfaceData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="Surface Data" ColumnSpan="2"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Wellhead Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:Label ID="lblWellheadPressure" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Wellhead Temperature" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblWellheadTemperature" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Flowline Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblFlowlinePressure" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td style="height:100px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Table ID="TablePumpOperatingData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="Pump Operating Data" ColumnSpan="2" HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Bottomhole Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblBottomholePressure" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump Intake Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpIntakePressure" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump Discharge Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpDischargePressure" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump Discharge Temperature" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpDischargeTemperature" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump Flow Rate" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpFlowRate" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Intake Free Gas" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblIntakeFreeGas" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Fluid Level Above Pump" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblFluidLevelAbovePump" runat="server" Text="Label" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Fluid Level Measurement Date" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblFluidLevelMeasurementDate" runat="server" Text="Label" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableMotorOperatingData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="Motor Operating Data" ColumnSpan="2"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Motor Winding Temperature" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblMotorWindingTemperature" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Motor Vibration" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblMotorVibration" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Current Leakage" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblCurrentLeakage" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Current Imbalance" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblCurrentImbalance" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Voltage Imbalance" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblVoltageImbalance" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TablePerforationData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                            <asp:TableHeaderCell Text="Perforation Data" ColumnSpan="2"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>      
                                            <asp:TableCell Width="30%" HorizontalAlign="Left">
                                                <asp:LinkButton ID="btnAddPerforationData" runat="server">Add Perforation Data</asp:LinkButton>
                                            </asp:TableCell>                                            
                                            <asp:TableCell Text="" Width="70%" Font-Bold="false" HorizontalAlign="Left">
                                                <asp:DropDownList ID="ddlPerforationData" Width="100" runat="server">
                                                </asp:DropDownList>
                                            </asp:TableCell>                                            
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Depth - Top of Perfs." Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblDepthTopOfPerfs" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Depth - Bottom of Perfs." Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblDepthBottomOfPerfs" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Perf. Density" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPerfDensity" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump Suction Depth" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpSuctionDepth" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>                                        
                                     </asp:Table>                            
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 40%" valign="top">
                        <table>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableESPSystemStatus" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="ESP System Status" ColumnSpan="4"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="" Width="70%" Font-Bold="true"></asp:TableCell>
                                            <asp:TableCell Text="Make" HorizontalAlign="Center" Width="70%" Font-Bold="true"></asp:TableCell>
                                            <asp:TableCell Text="Modal" HorizontalAlign="Center" Width="70%" Font-Bold="true"></asp:TableCell>
                                            <asp:TableCell Text="Serial No." HorizontalAlign="Center" Width="70%" Font-Bold="true"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump" Width="70%" Font-Bold="true"></asp:TableCell>
                                            <asp:TableCell Text="" Width="70%" Font-Bold="false" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpMake" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                
                                            </asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpModal" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                                                                
                                            </asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblPumpSerialNo" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                                                                
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Motor" Width="70%" Font-Bold="true"></asp:TableCell>
                                            <asp:TableCell Text="" Width="70%" Font-Bold="false" HorizontalAlign="Center">
                                                <asp:Label ID="lblMotorMake" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                                                                                                                
                                            </asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblMotorModal" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                                                                                                                
                                            </asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblMotorSerialNo" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="70" Height="15"></asp:Label>                                                                                                                                                
                                            </asp:TableCell>
                                        </asp:TableRow>     
                                        <asp:TableRow>
                                            <asp:TableCell Text="No. of steps" Width="30%" Font-Bold="True" ColumnSpan="2"></asp:TableCell>
                                            
                                            
                                            <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">                                                
                                                <asp:Label ID="lblNoOfSteps" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="140" Height="15"></asp:Label>                                                                                                                                                
                                            </asp:TableCell>                                            
                                        </asp:TableRow>                                                                           
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableStatusSummary" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        
                                        <asp:TableRow>
                                            <asp:TableCell Text="Pump System Status Summary" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Center">                                                
                                            </asp:TableCell>
                                            <asp:TableCell Text="" Width="70%" Font-Bold="false" HorizontalAlign="Center">
                                                <asp:LinkButton ID="lbtnViewPumpSystemStatusSummary" runat="server">View</asp:LinkButton>                                                
                                            </asp:TableCell>                                                                                        
                                        </asp:TableRow>                                        
                                        <asp:TableRow>
                                            <asp:TableCell Text="Alarm Status Summary" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Center">                                                
                                            </asp:TableCell>
                                            <asp:TableCell Text="" Width="70%" Font-Bold="false" HorizontalAlign="Center">
                                                <asp:LinkButton ID="lbtnViewAlarmStatusSummary" runat="server">View</asp:LinkButton>                                                
                                            </asp:TableCell>                                                                                        
                                        </asp:TableRow>                                        
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableVSDOperatingData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="VSD Operating Data" ColumnSpan="2"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Optimum Frequency" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblOptimumFrequency" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Operating Frequency" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblOperatingFrequency" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Current" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblCurrent" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Voltage" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblVoltage" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>                                        
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableControlDataOperatorsOnly" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell Text="Control Data - Operators Only" ColumnSpan="3"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Shut Down" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Left">
                                                <asp:RadioButton ID="RadioButtonShutDown"  ForeColor="Red" runat="server" Checked="true"  GroupName="RadioStatus" />
                                            </asp:TableCell>                                            
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Start Up" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Left">
                                                <asp:RadioButton ID="RadioButtonStartUp" ForeColor="Green" runat="server" Checked="false" GroupName="RadioStatus" />
                                            </asp:TableCell>                                            
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Current" Width="50%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="25%" HorizontalAlign="left">
                                                <asp:TextBox ID="txtChangeVSDFrequency" Width="50" Height="10" runat="server"></asp:TextBox>                                                
                                            </asp:TableCell>
                                            <asp:TableCell Width="25%" HorizontalAlign="left">
                                                <asp:LinkButton ID="lbtnUpdate" runat="server">Update</asp:LinkButton>                                                
                                            </asp:TableCell>
                                        </asp:TableRow>                                        
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Table ID="Table3" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableRow>                                            
                                            <asp:TableCell HorizontalAlign="Center">                                                
                                                <DCWC:Chart ID="ChartESPCurve" runat="server">
                                                    <Series>
                                                        <DCWC:Series Name="Default_AutoRunWizard">
                                                        </DCWC:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <DCWC:ChartArea Name="Default">
                                                        </DCWC:ChartArea>
                                                    </ChartAreas>
                                                </DCWC:Chart>
                                            </asp:TableCell>                                            
                                        </asp:TableRow>                                                                                
                                     </asp:Table>                            
                                </td>
                            </tr>
                            <tr>
                                <td>                            
                                    <asp:Table ID="TableReservoirData" SkinID="TableDefaultSkin" runat="server" Width="100%"
                                        CssClass="gridviewheader" CellPadding="1" CellSpacing="1" HeaderStyle-HorizontalAlign="Left" BackColor="White" HorizontalAlign="Left" GridLines="None" BorderColor="#555555" BorderStyle="Solid" BorderWidth="2px">
                                        <asp:TableHeaderRow>
                                            <asp:TableHeaderCell Text="Reservoir Data" ColumnSpan="2"  HorizontalAlign="Left"></asp:TableHeaderCell>
                                        </asp:TableHeaderRow>                                        
                                        <asp:TableRow>
                                            <asp:TableCell Text="Reservoir Pressure" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblReservoirPressure" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Reservoir Temperature" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblReservoirTemperature" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Measurement Date" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblMeasurementDate" runat="server" Text="Label" ForeColor="#002d59" BackColor="White" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Text="Productivity Index (PI)" Width="70%" Font-Bold="false"></asp:TableCell>
                                            <asp:TableCell Width="30%" HorizontalAlign="Center">
                                                <asp:Label ID="lblProductivityIndex" runat="server" Text="Label" ForeColor="White" BackColor="#002d59" Width="75" Height="15"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>                                                    
                                     </asp:Table>                            
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>
            </table>
        </asp:Panel>        
    </ContentTemplate>
    </asp:UpdatePanel>    
</asp:Content>

