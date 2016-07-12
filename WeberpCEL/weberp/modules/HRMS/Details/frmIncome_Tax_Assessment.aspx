<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmIncome_Tax_Assessment.aspx.cs" Inherits="modules_HRMS_Details_frmIncome_Tax_Assessment" %>

<%@ Register Assembly="ProudMonkey.Common.Controls" Namespace="ProudMonkey.Common.Controls" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="ew" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:MessageBox ID="MessageBox1" runat="server" />
    <asp:UpdatePanel ID="updpnl2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                Income Tax Assessment
            </asp:Panel>


            <asp:Panel ID="PanelLeaveDet" runat="server" CssClass="cpBodyContent" Width="100%" Height="100%">
                <table style="width: 99%; text-align: left">
                    <tr>
                        <td style="width: 182px; text-align: right">
                            <asp:Label ID="Label2" runat="server" Text="Select Company"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:DropDownList ID="ddlcompany" runat="server" AutoPostBack="True" CssClass="tbl" Width="355px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px; text-align: right">
                            <asp:Label ID="Label3" runat="server" Text="From Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtFromDate" runat="server" placeholder="From Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFromDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px; text-align: right">
                            <asp:Label ID="Label4" runat="server" Text="To Date"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtToDate" runat="server" placeholder="To Date" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtToDate">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px; text-align: right">
                            <asp:Label ID="Label99" runat="server" Text="Employee Search"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtemployeeSearch" runat="server" AutoPostBack="True" CssClass="btn2" OnTextChanged="txtemployeeSearch_TextChanged" Width="350px"></asp:TextBox>
                            <ajaxToolkit:AutoCompleteExtender ID="txtemployeeSearch_AutoComplxtender" runat="server" BehaviorID="txtemployeeSearch_Autopxtender" CompletionListCssClass="autocomplete_completionListElement" CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" CompletionListItemCssClass="autocomplete_listItem2" Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetEmpId" ServicePath="~/modules/Payroll/WebService.asmx" TargetControlID="txtemployeeSearch">
                            </ajaxToolkit:AutoCompleteExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 182px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnView" runat="server" Text="View" Width="100px" OnClick="btnView_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px">
                            <asp:Button ID="btnExporttoExcel" runat="server" OnClick="btnExporttoExcel_Click" Text="Export to Excel" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="grdTaxAssesment" runat="server" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdTaxAssesment_RowDataBound" ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="SL">
                                        <ItemTemplate>
                                            <%# Container.DisplayIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee">
                                        <FooterTemplate>
                                            <asp:Label ID="Label100" runat="server" Text="Total :" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("EmpName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpcode" runat="server" Text='<%# Bind("Empcode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Basic Pay">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterBasic" runat="server" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBasic" runat="server" Text='<%# Bind("Basic","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Over Time">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterOverTime" runat="server" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOverTime" runat="server" Text='<%# Bind("[Over Time]","{0:0.00}") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Leave Fare Assistance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterLeaveFareAssistance" runat="server" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLeaveFareAssistance" runat="server" Text='<%# Bind("[Leave Fare Assistance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Incentive Bonus">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterIncentiveBonus" runat="server" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIncentiveBonus" runat="server" Text='<%# Bind("[Incentive Bonus]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Festival Bonus">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterFestivalBonus" runat="server" Font-Bold="True"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFestivalBonus" runat="server" Text='<%# Bind("[Festival Bonus]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contribution  to recognized provident fund">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterProvidentFund" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProvidentFund" runat="server" Text='<%# Bind("[Contribution  to recognized provident fund]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterTotalPart1" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalPart1" runat="server" Text='<%# Bind("[TotalPart1]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="House Rent Allowance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterHouseRentAllowance" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHouseRentAllowance" runat="server" Text='<%# Bind("[House Rent Allowance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Conveyance Allowance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterConveyanceAllowance" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblConveyanceAllowance" runat="server" Text='<%# Bind("[Conveyance Allowance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Medical Allowance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterMedicalAllowance" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMedicalAllowance" runat="server" Text='<%# Bind("[Medical Allowance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Food Allowance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterFoodAllowance" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFoodAllowance" runat="server" Text='<%# Bind("[Food Allowance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Other Allowance">
                                        <FooterTemplate>
                                            <asp:Label ID="lblFooterOtherAllowance" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOtherAllowance" runat="server" Text='<%# Bind("[Other Allowance]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total ">
                                         <FooterTemplate>
                                            <asp:Label ID="lblFooterTotalPart2" runat="server" Font-Bold="True" ></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalPart2" runat="server" Text='<%# Bind("[TotalPart2]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Admissible limit">                                         
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdmissiblelimit" runat="server" Text='<%# Bind("[Admissible limit]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inadmissible amount">                                         
                                        <ItemTemplate>
                                            <asp:Label ID="lblInadmissibleamount" runat="server" Text='<%# Bind("[Inadmissible amount]","{0:0.00}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 182px">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnView" />
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
