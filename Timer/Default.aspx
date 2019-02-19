<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Timer.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        var seconds = 0;
        try { seconds = int.Parse(Request.QueryString["seconds"]); } catch (Exception e) { }

        int chattySeconds = 1;
        var writeChattySeconds = false;
        try
        {
            chattySeconds = int.Parse(Request.QueryString["chattySeconds"]);
            writeChattySeconds = true;
        }
        catch (Exception e) { }

        var startTime = DateTime.Now;

        if (seconds > 0)
        {
            double totalSeconds = 0;
            while (totalSeconds < seconds)
            {
                System.Threading.Thread.Sleep(chattySeconds * 1000);
                totalSeconds = (DateTime.Now - startTime).TotalSeconds;
                if (writeChattySeconds)
                {
    %><%=(int)totalSeconds%><br />
    <%
            }
            Response.Flush();
        }
    %>delayed response for <%=(int)seconds%> seconds.<br />
    <%
        }
        else
        {
    %>delayed response for 0 seconds. Pass the 'seconds' querystring parameter to delay response for longer.<br />
    <%
        }
    %>
</body>
</html>
