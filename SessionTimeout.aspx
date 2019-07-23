<%@ page language="C#" autoeventwireup="true" inherits="SessionTimeout, App_Web_q1bp2ybq" theme="Grey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ZDV Web Studio</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table width="100%">
            <tr>
                <td align="center" valign="middle">
                    <asp:Panel ID="Panel1" Width="300px" GroupingText="Session Timeout" CssClass="Panel"
                        runat="server">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="LabelSessionTimeout" runat="server" Text="Your session has timed out!"
                                        ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="Button1" runat="server" Text="Click here to Login" OnClientClick="window.open('Default.aspx','','toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=1024,height=768,left=0,top=0'); window.close();" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
