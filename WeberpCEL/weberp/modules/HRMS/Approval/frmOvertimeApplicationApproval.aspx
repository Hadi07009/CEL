<%@ Page Title="" Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmOvertimeApplicationApproval.aspx.cs" Inherits="modules_HRMS_Approval_frmOvertimeApplicationApproval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .style2 {
            height: 18px;
        }

        .style7 {
            width: 109px;
            text-align: left;
        }

        .style8 {
            width: 24px;
        }

        .style9 {
            width: 348px;
            text-align: left;
        }

        .style10 {
            width: 81px;
            text-align: left;
        }

        .style11 {
            width: 13px;
        }

        .style20 {
            width: 357px;
        }

        .style21 {
            width: 83px;
            text-align: left;
        }

        .style22 {
            width: 15px;
        }

        .style23 {
            width: 156px;
        }

        .style24 {
        }

        .style25 {
            width: 109px;
            text-align: left;
            height: 18px;
        }

        .style26 {
            width: 24px;
            height: 18px;
        }
    </style>
    <asp:UpdatePanel ID="updtPnl" runat="server">
        <ContentTemplate>
            <div align="center">
                <asp:Panel ID="pnlSrchHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                    <asp:Label ID="lblSearchHdr" Text="Search" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlSrchDet" runat="server" CssClass="cpBodyContent" >
                    <table style="width:99%;text-align:left">
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                             <td colspan="3">
                                 <asp:GridView ID="GridViewLeavePending" runat="server" AutoGenerateColumns="False"
                                                OnRowDataBound="GridViewLeavePending_RowDataBound" Width="100%"
                                                OnSelectedIndexChanged="GridViewLeavePending_SelectedIndexChanged"
                                                OnPageIndexChanging="GridViewLeavePending_PageIndexChanging"
                                                OnRowCommand="GridViewLeavePending_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="Sl" HeaderStyle-HorizontalAlign="Center"
                                                        HeaderText="SL #" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TransactionNo" HeaderStyle-HorizontalAlign="Left"
                                                        HeaderText="Referance" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ApplicantId" HeaderStyle-HorizontalAlign="Left"
                                                        HeaderText="Emp ID" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="EmpName"
                                                        HeaderStyle-HorizontalAlign="Left" HeaderText="Name"
                                                        ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Designation"
                                                        HeaderStyle-HorizontalAlign="Left" HeaderText="Designation"
                                                        ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="LeaveType" HeaderStyle-HorizontalAlign="Left"
                                                        HeaderText="Type" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Overtime" HeaderStyle-HorizontalAlign="Left"
                                                        HeaderText="Overtime" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="noofdays" HeaderStyle-HorizontalAlign="Center"
                                                        HeaderText="Hour" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ProcessLevelid" HeaderStyle-HorizontalAlign="Center"
                                                        HeaderText="Level" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ownerofthistask"
                                                        HeaderText="On behalf of"></asp:BoundField>

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlLoadPermission" runat="server">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnSubmit" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                CommandName="Submit" runat="server" Text="Submit" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                </asp:Panel>
                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtenderSrch" runat="server"
                                TargetControlID="pnlSrchDet"
                                CollapseControlID="pnlSrchHdr"
                                ExpandControlID="pnlSrchHdr"
                                Collapsed="false"
                                TextLabelID="lblSearchHdr"
                                CollapsedText="Pending Overtime Application"
                                ExpandedText="Pending Overtime Application"                                
                                AutoCollapse="False"
                                AutoExpand="false"
                                ScrollContents="false"
                                ImageControlID="Image1"
                                ExpandedImage="~/images/collapse.jpg"
                                CollapsedImage="~/images/expand.jpg"
                                ExpandDirection="Vertical">
                </cc1:CollapsiblePanelExtender>
                <br />
            </div>
            <asp:Panel ID="Panel50" runat="server" Width="100%">
                <div align="center">
                    <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                        <asp:Label ID="lblleave" Text="OVERTIME APPLICATION DETAILS" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="PanelLeaveDet" runat="server" CssClass="cpBodyContent" >
                        <table style="width:99%;text-align:left">
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#3333FF"></asp:Label>
                                    <br />
                                </td>
                                 <td>&nbsp;</td>
                            </tr>
                            <tr>
                                 <td colspan="3">
                                     <table style="width: 100%;">
                                          <tr>
                                              <td class="style9">
                                                  <asp:Label ID="Label7" runat="server" Text="Employee Information"></asp:Label>
                                              </td>
                                              <td class="style20">&nbsp;</td>
                                              <td class="style23">&nbsp;</td>
                                              <td style="text-align: center">
                                                  <asp:Label ID="Label15" runat="server" Text="Previous OT Information"></asp:Label>
                                              </td>
                                          </tr>
                                         <tr>
                                             <td class="style9">
                                                  <table style="width: 100%;">
                                                       <tr>
                                                           <td class="style10">
                                                               <asp:Label ID="Label8" runat="server" Text="ID"></asp:Label>
                                                           </td>
                                                           <td class="style11">:</td>
                                                           <td style="text-align: left">
                                                               <asp:Label ID="lblId" runat="server"></asp:Label>
                                                           </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lblName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label10" runat="server" Text="Department"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lbldept" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label11" runat="server" Text="Designation"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label12" runat="server" Text="Joining Date"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lblJoiningDate" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label13" runat="server" Text="Period"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lblPeriod" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style10">
                                                                        <asp:Label ID="Label14" runat="server" Text="Date"></asp:Label>
                                                                    </td>
                                                                    <td class="style11">:</td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="lblcurrentPeriod" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td class="style20">
                                                            <asp:GridView ID="gdvLeaveInfo" runat="server" AutoGenerateColumns="False"
                                                                OnRowDataBound="gdvLeaveInfo_RowDataBound">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Code" HeaderStyle-HorizontalAlign="Left"
                                                                        HeaderText="SL #" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField DataField="Leave_Mas_Name" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderText="Leave Type" ItemStyle-HorizontalAlign="Center" />
                                                                    <asp:BoundField DataField="AllocatedLeave" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderText="Allowed" ItemStyle-HorizontalAlign="Center" />
                                                                    <asp:BoundField DataField="Enjoyed" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderText="Enjoyed" ItemStyle-HorizontalAlign="Center" />
                                                                    <asp:BoundField DataField="LeaveBal" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderText="Balance" ItemStyle-HorizontalAlign="Center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <td class="style23">
                                                            <asp:Image ID="Image1" runat="server" Height="100px" Visible="False"
                                                                Width="100px" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td class="style21">
                                                                        <asp:Label ID="Label16" runat="server" Text="From"></asp:Label>
                                                                    </td>
                                                                    <td class="style22">:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFromDate" runat="server" Width="178px"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server"
                                                                            Format="dd/MM/yyyy" TargetControlID="txtFromDate">
                                                                        </cc1:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style21">
                                                                        <asp:Label ID="Label17" runat="server" Text="To"></asp:Label>
                                                                    </td>
                                                                    <td class="style22">:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtToDate" runat="server" Width="178px"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="txtToDate_CalendarExtender" runat="server"
                                                                            Format="dd/MM/yyyy" TargetControlID="txtToDate">
                                                                        </cc1:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style21">&nbsp;</td>
                                                                    <td class="style22">&nbsp;</td>
                                                                    <td>
                                                                        <asp:Button ID="btnShow" runat="server" Text="Show OT" Width="100px"
                                                                            OnClick="btnShow_Click" Visible="False" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style21">
                                                                        <asp:Button ID="btnprevious" runat="server" OnClick="btnprevious_Click"
                                                                            Text="&lt;&lt;" Visible="False" Width="50px" />
                                                                    </td>
                                                                    <td class="style22">&nbsp;</td>
                                                                    <td>
                                                                        <asp:Button ID="btnShowALL" runat="server" OnClick="btnShowALL_Click"
                                                                            Text="Show ALL" Width="100px" />
                                                                        <asp:Button ID="btnCurrentPeriod" runat="server" OnClick="btnCurrentPeriod_Click"
                                                                            Text="Refresh" Width="100px" Visible="False" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td colspan="3">
                                                <asp:GridView ID="grdOvertime" runat="server" AutoGenerateColumns="False"
                                                    Width="100%" OnRowDataBound="grdOvertime_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="Sl" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="SL #" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Atnd_det_date" DataFormatString="{0:d}"
                                                            HeaderStyle-HorizontalAlign="Center" HeaderText="Date"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="weekdayname" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Day Name" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Atnd_det_offlg" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Description" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Sys_det_intime"
                                                            HeaderStyle-HorizontalAlign="Center" HeaderText="In Time"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Sys_det_outtime" DataFormatString="{0:d}"
                                                            HeaderStyle-HorizontalAlign="Center" HeaderText="Out Time"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Atnd_det_hrs" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="Hours" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText=" Actual Intime" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <MKB:TimeSelector ID="timeoff1" runat="server" AmPm="AM" DisplaySeconds="False"
                                                                    Hour="9">
                                                                </MKB:TimeSelector>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Out Date">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtntDate1" runat="server"
                                                                    Text='<%# Eval("atnd_det_date", "{0:d}") %>'> &gt;</asp:TextBox>
                                                                <cc1:CalendarExtender ID="txtntDate1_CalendarExtender0" runat="server"
                                                                    Enabled="True" Format="dd/MM/yyyy" OnClientDateSelectionChanged="checkDate"
                                                                    TargetControlID="txtntDate1">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText=" Actual Outtime" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <MKB:TimeSelector ID="timeoff2" runat="server" AmPm="PM" Date="2013-02-27"
                                                                    DisplaySeconds="False" Hour="6">
                                                                </MKB:TimeSelector>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Status"
                                                            ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblstatus" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="EmpName" HeaderStyle-HorizontalAlign="Left"
                                                            HeaderText="Action Taken By" ItemStyle-HorizontalAlign="Left">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Select"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckRet" runat="server" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderStyle-HorizontalAlign="Center" HeaderText="LockedL"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderStyle-HorizontalAlign="Center" HeaderText="LockedP"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Action" HeaderStyle-HorizontalAlign="Center" HeaderText="Action"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ProcessLevelid" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="PLid" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="actin" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderText="actout" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TransactionNo" HeaderText="tno" />
                                                        <asp:BoundField DataField="TransactionNoLineNo" HeaderText="tlno" />
                                                        <asp:BoundField DataField="noofdays" HeaderText="Overtime" />
                                                        <asp:BoundField DataField="Atnd_det_intime" HeaderText="DActualIntime" />
                                                        <asp:BoundField DataField="Atnd_det_outtime" HeaderText="DActualOuttime" />
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>


                                        <tr>
                                            <td colspan="3">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td class="style25">
                                                            <asp:Label ID="Label5" runat="server" Text="Responsible Person"></asp:Label>
                                                        </td>
                                                        <td class="style26">:</td>
                                                        <td style="text-align: left" colspan="2">
                                                            <asp:Label ID="lblResponsibleperson" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label6" runat="server" Text="Remarks"></asp:Label>
                                                        </td>
                                                        <td>:</td>
                                                        <td class="style24" style="text-align: left">
                                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="500px"
                                                                Font-Size="Medium"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:Button ID="btnPostLeave" runat="server" OnClick="btnPostLeave_Click"
                                                                Text="Post Leave" />
                                                            <asp:Button ID="btnApply" runat="server" OnClick="btnApply_Click"
                                                                Text="Apply Leave" Width="100px" />
                                                            <asp:Button ID="btnForward" runat="server" OnClick="btnForward_Click"
                                                                Text="Forward" Width="100px" />
                                                            <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click"
                                                                Text="Return" Width="100px" />
                                                            <asp:Button ID="btnReject" runat="server" OnClick="btnReject_Click"
                                                                Text="Reject" Width="100px" />
                                                            <asp:Button ID="btnApprove" runat="server" OnClick="btnApprove_Click"
                                                                Text="Approve" Width="100px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td class="style24" style="text-align: left">
                                                            <asp:TextBox ID="txtRemarksAll" runat="server" TextMode="MultiLine"
                                                                Width="500px" Font-Size="Medium"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="text-align: left">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>


                                    </table>
                    </asp:Panel>
                    <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server"
                                    TargetControlID="PanelLeavedet"
                                    CollapseControlID="PanelLeaveHdr"
                                    ExpandControlID="PanelLeaveHdr"
                                    Collapsed="false"
                                    TextLabelID="lblleave"
                                    CollapsedText="OVERTIME APPLICATION DETAILS"
                                    ExpandedText="OVERTIME APPLICATION DETAILS"                                    
                                    AutoCollapse="False"
                                    AutoExpand="false"
                                    ScrollContents="false"
                                    ImageControlID="Image1"
                                    ExpandedImage="~/images/collapse.jpg"
                                    CollapsedImage="~/images/expand.jpg"
                                    ExpandDirection="Vertical">
                    </cc1:CollapsiblePanelExtender>
                </div>
            </asp:Panel>
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnApprove" />
            <asp:PostBackTrigger ControlID="btnApply" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
