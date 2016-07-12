﻿<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmTaxChallan.aspx.cs" Inherits="modules_HRMS_Payroll_frmTaxChallan" %>

<%@ Register Assembly="ProudMonkey.Common.Controls" Namespace="ProudMonkey.Common.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="ew" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:MessageBox ID="MessageBox1" runat="server" />
    <cc1:ConfirmBox ID="ConfirmBox1" runat="server" />
    <asp:UpdatePanel ID="updpnl2" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                <asp:Label ID="lblleave" Text=" Tax Challan" runat="server" />
            </asp:Panel>
            <asp:Panel ID="PanelLeaveDet" runat="server" CssClass="cpBodyContent" Width="100%" Height="100%">
                <table style="width: 99%; text-align: left">
                    <tr>
                        <td style="width: 168px">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 168px">
                            <asp:Label ID="Label4" runat="server" Text="Select File"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:FileUpload ID="file_upload" runat="server" class="multi" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnUploadAttachment" runat="server" OnClick="btnUploadAttachment_Click" OnClientClick="ShowConfirmBox(this,'Are you Sure, Upload Tax Challan?'); return false;" Text="Upload Attachment" Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnUploadTaxChallan" runat="server" OnClick="btnUploadTaxChallan_Click" OnClientClick="ShowConfirmBox(this,'Are you Sure, update Tax Challan Data?'); return false;" Text="Update Tax Challan" Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Search By Challan Date"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">
                            <asp:Label ID="Label2" runat="server" Text="From Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="CalenderFromDate" runat="server" autocomplete="off" placeholder="From Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalenderFromDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="CalenderFromDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">
                            <asp:Label ID="Label3" runat="server" Text="To Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="CalenderToDate" runat="server" autocomplete="off" placeholder="To Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalenderToDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="CalenderToDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnView" runat="server" Text="View" Width="150px" OnClick="btnView_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="grdTaxChallan" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="grdTaxChallan_RowCommand" OnRowDeleting="grdTaxChallan_RowDeleting">
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
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Challan Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChallanDate" runat="server" Text='<%# Bind("ChallanDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Month">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChallanForMonth" runat="server" Text='<%# Bind("ChallanForMonth", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Challan Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChallanNumber" runat="server" Text='<%# Bind("ChallanNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Challan Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchallamAmount" runat="server" Text='<%# Bind("challamAmount","{0:0.00}") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 168px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </asp:Panel>
                    </ContentTemplate>
                        <Triggers>
                             <asp:PostBackTrigger ControlID="btnUploadTaxChallan" />
                            <asp:PostBackTrigger ControlID="btnView" />
                            <asp:PostBackTrigger ControlID="btnUploadAttachment" />
                        </Triggers>
         </asp:UpdatePanel>
</asp:Content>