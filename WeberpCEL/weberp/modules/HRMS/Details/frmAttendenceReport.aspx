<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmAttendenceReport.aspx.cs" Inherits="modules_HRMS_Details_frmAttendenceReport" %>

<%@ Register Assembly="ProudMonkey.Common.Controls" Namespace="ProudMonkey.Common.Controls" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="ew" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:MessageBox ID="MessageBox1" runat="server" />
    <style type="text/css">
        .cpHeader {
            color: white;
            background-color: #719DDB;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 12px;
            cursor: pointer;
            height: 18px;
            padding: 4px;
        }

        .cpBody {
            background-color: #DCE4F9;
            font: normal 12px auto "Trebuchet MS";
            border: 1px gray;
            padding: 4px;
            padding-top: 2px;
            height: 0px;
            overflow: hidden;
        }

        .auto-style4 {
            width: 138px;
        }

        </style>
    <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
        Employees Attendence Report
    </asp:Panel>
    <asp:Panel ID="PanelLeaveDet" runat="server" CssClass="cpBodyContent" Width="100%" Height="100%">
        <table style="width: 99%; text-align: left">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Select Company"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="ddlcompany" runat="server" CssClass="tbl" Width="385px"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Date From"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <ew:CalendarPopup ID="txtFromDate" runat="server" CssClass="txtbox" Culture="English (United Kingdom)" Enabled="true" Width="350px">
                        <MonthHeaderStyle BackColor="#2A2965" />
                        <ButtonStyle CssClass="btn2" />
                    </ew:CalendarPopup>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Date To"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <ew:CalendarPopup ID="txtToDate" runat="server" CssClass="txtbox" Culture="English (United Kingdom)" Enabled="true" Width="350px">
                        <MonthHeaderStyle BackColor="#2A2965" />
                        <ButtonStyle CssClass="btn2" />
                    </ew:CalendarPopup>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" runat="server" Text="Office Location"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <div style="OVERFLOW-Y: scroll; WIDTH: 380px; HEIGHT: 175px; border: 1px solid; border-color: #669999; border-style: Ridge">

                        <asp:CheckBoxList ID="chkofficelocation" runat="server">
                        </asp:CheckBoxList>
                    </div>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="ddlDepartmentId" runat="server" AutoPostBack="True" Width="385px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label11" runat="server" Text="Employee Category"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="ddlEmpCategory" runat="server" AutoPostBack="True" Width="385px">
                        <asp:ListItem Value="-1">ALL</asp:ListItem>
                        <asp:ListItem>Officer</asp:ListItem>
                        <asp:ListItem>Staff</asp:ListItem>
                        <asp:ListItem>Worker</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Employee ID"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtEmpId" runat="server" CssClass="btn2" Width="380px" AutoCompleteType="None" AutoPostBack="True" OnTextChanged="txtEmpId_TextChanged"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="txtEmpId_AutoCompleteExtender" runat="server" DelimiterCharacters="" Enabled="True"
                        CompletionListCssClass="autocomplete_completionListElement"
                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                        CompletionListItemCssClass="autocomplete_listItem2"
                        MinimumPrefixLength="1" ServiceMethod="GetEmpId"
                        ServicePath="~/modules/Payroll/WebService.asmx" TargetControlID="txtEmpId">
                    </ajaxToolkit:AutoCompleteExtender>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnPreviewSummary" runat="server" CssClass="btn2" OnClick="btnPreviewSummary_Click" Text="Show" Width="150px" />
                    &nbsp; &nbsp; &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnExport" runat="server" CssClass="btn2" OnClick="btnExport_Click" Text="Export" Width="150px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="grdAttendanceRecord" runat="server" AutoGenerateColumns="False" Width="100%" EmptyDataText="No Data Found">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                    <%# Container.DisplayIndex + 1 %>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeId" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EmpName" HeaderText="Employee Name" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Designation" HeaderText="Designation" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Dept" HeaderText="Department" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="WorkingDay" HeaderText="Working Days" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LeaveDay" HeaderText="Leave" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total Working Days" HeaderText="Total Working Days" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total Working Hours" HeaderText="Total Working Hours" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Net Working Hours" HeaderText="Net Working Hours" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Extra/ Shortage Working Hours" HeaderText="Extra/ Shortage Working Hours" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="No. of Late Attendance" HeaderText="No. of Late Attendance" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>

        </table>
    </asp:Panel>


</asp:Content>
