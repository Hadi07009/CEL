﻿<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmTaxOtherRoleSetup.aspx.cs" Inherits="modules_HRMS_Payroll_frmTaxOtherRoleSetup" %>

<%@ Register Assembly="ProudMonkey.Common.Controls" Namespace="ProudMonkey.Common.Controls" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:MessageBox ID="MessageBox1" runat="server" />
    <asp:UpdatePanel ID="updpnl2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                <asp:Label ID="lblleave" Text=" TAX OTHER ROLE SETUP" runat="server" />
            </asp:Panel>
            <asp:Panel ID="PanelLeaveDet" runat="server" CssClass="cpBodyContent" Width="100%" Height="100%">
                <table style="width: 99%; text-align: left">
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label1" runat="server" Text="Financial Year"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" Width="355px" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label4" runat="server" Text="Slab For"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" Width="355px" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="-1">--- Please Select ---</asp:ListItem>
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label2" runat="server" Text="From Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtFromDate" runat="server" placeholder="From Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFromDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label3" runat="server" Text="To Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtToDate" runat="server" placeholder="To Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtToDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label6" runat="server" Text="Min Tax Amount"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtMinTaxAmount" runat="server" onkeypress="return isNumberKey(event)" Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label9" runat="server" Text="Investment Limit Percentage"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtInvestmentLimitPercentage" runat="server" onkeypress="return isNumberKey(event)" Width="100px"></asp:TextBox>
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">
                            <asp:Label ID="Label7" runat="server" Text="Tax Deduction Percentage"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtTaxDeductionPercentage" runat="server" onkeypress="return isNumberKey(event)" Width="100px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label8" runat="server" Font-Bold="True" Text="%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 187px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" />
                            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="grdSlabRecord" runat="server" Width="100%" AutoGenerateColumns="False" OnRowCommand="grdSlabRecord_RowCommand" OnRowDeleting="grdSlabRecord_RowDeleting" OnRowDataBound="grdSlabRecord_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="ReferenceNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreferenceNumber" runat="server" Text='<%# Bind("referenceNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Financial Year">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfinancialYear" runat="server" Text='<%# Bind("financialYear") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slab For Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblslabType" runat="server" Text='<%# Bind("slabType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slab For">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgenderText" runat="server" Text='<%# Bind("genderText") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromDate" runat="server" Text='<%# Bind("fromDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltoDate" runat="server" Text='<%# Bind("toDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slab">
                                        <ItemTemplate>
                                            <asp:Label ID="lblslab" runat="server" Text='<%# Bind("slab") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Min Tax Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMinTaxAmount" runat="server" Text='<%# Bind("MinTaxAmount","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Investment Limit Percentage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvestMentLimitPercentage" runat="server" Text='<%# Bind("InvestMentLimitPercentage","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tax Deduction Percentage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTaxDeductionPercentage" runat="server" Text='<%# Bind("TaxDeductionPercentage","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:CommandField ShowSelectButton="True" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:CommandField>
                                    <asp:CommandField ShowDeleteButton="True" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 187px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 187px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <%--<asp:PostBackTrigger ControlID="ddlGender" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 57) {
                alert("Please Enter Only Numeric Value:");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
