<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SQLInjection.Login" %>    #A

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 503px;
            height: 249px;
            margin-left: 67px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 280px">
    
        <br />
        <br />
        <asp:Login ID="Login1" runat="server" Height="244px" OnAuthenticate="Login1_Authenticate" Width="483px" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" style="margin-left: 64px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="SQLInjection.Welcome" %>    #B

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 856px;
            height: 336px;
            margin-left: 235px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Welcome!"></asp:Label>
    </form>
</body>
</html>
