﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_report_viewer.aspx.cs" Inherits="ClientSide_modules_commercial_reports_frm_report_viewer" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LinkOffice :: Report</title>
    <style type="text/css">
	
table
{
	font-size: 1em;
	}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
                
                
             <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                    HasCrystalLogo="False" HasToggleGroupTreeButton="False" Height="50px" style="text-align: left" 
                    ToolbarStyle-BorderStyle="None" Width="350px" ToolPanelView="None" ReuseParameterValuesOnRefresh="true"
                    onunload="CrystalReportViewer1_Unload" PrintMode="ActiveX" />
          
                
    </div>
    
    </form>
</body>
</html>
