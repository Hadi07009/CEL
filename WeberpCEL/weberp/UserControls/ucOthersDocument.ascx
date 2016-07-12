﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucOthersDocument.ascx.cs" Inherits="usercontrols_ucOthersDocument" %>
<style type="text/css">
    .ucbgcolorfont {
        background-color: silver;
        font-family: 'Helvetica Neue LT';
        font-size: 12pt;
    }

    .ucColStyle {
        background-color: silver;
        font-family: 'Helvetica Neue LT';
        font-size: 12pt;
        text-align-last: center;
    }

    .ucBorderStyle {
        border-left-width: 0px;
        border-right-width: 0px;
        border-bottom: solid;
        border-top: solid;
        border-bottom-width: 0px;
        border-top-width: thin;
        border-bottom-color: navy;
        border-top-color: navy;
        background-color: silver;
        font-family: 'Helvetica Neue LT';
    }
</style>
<table style="width: 100%; background-color: white;">
    <tr style="height: 25px">

        <td>
            <asp:Panel ID="pnlform" runat="server" ScrollBars="Auto" >
                <asp:GridView ID="gdvFileLoad" runat="server" AutoGenerateColumns="False" BorderColor="LightBlue" BorderWidth="0px" OnRowDataBound="gdvFileLoad_RowDataBound" OnSelectedIndexChanged="gdvFileLoad_SelectedIndexChanged" OnRowCommand="gdvFileLoad_RowCommand" ShowHeader="False" Width="100%" OnRowDeleting="gdvFileLoad_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="SL" HeaderText="Sl#" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="left">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="450px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SavedFileName" HeaderText="SavedFileName" ItemStyle-Width="150px">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="employeeCode" HeaderText="EmployeeCode" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDownloadAcademic" runat="server" Enabled="true" ImageUrl="~/Images/imageAttachment.jpg" CommandName="Download" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </td>
    </tr>


</table>
