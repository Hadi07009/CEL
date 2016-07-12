<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frm_po_val_edit.aspx.cs" Inherits="frm_po_val_edit" Title=""   ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table id="tblmaster" runat="server" class="tblmas" style="width: 100%">
        <tr>
            <td style="height: 22px">
            </td>
            <td style="height: 22px">
            </td>
            <td style="height: 22px">
            </td>
        </tr>
        <tr>
            <td class="heading" colspan="3" style="text-align: center">
                PO UPDATE&nbsp;</td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 24px; text-align: center">
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 19px; text-align: left">
               
                <table style="width:100%;">
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            PO REF</td>
                        <td style="width: 16px">
                            :</td>
                        <td>
            <asp:TextBox ID="txtid" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="166px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            ITEM CODE</td>
                        <td style="width: 16px">
                            :</td>
                        <td>
            <asp:TextBox ID="txtitemcode" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="166px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            ITEM DET</td>
                        <td style="width: 16px">
                            &nbsp;</td>
                        <td>
            <asp:TextBox ID="txtitem" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="389px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            PARTY CODE</td>
                        <td style="width: 16px">
                            &nbsp;</td>
                        <td>
            <asp:TextBox ID="txtpcode" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="166px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            PARTY DETAILS</td>
                        <td style="width: 16px">
                            :</td>
                        <td>
            <asp:TextBox ID="txtparty" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="389px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            QUANTITY</td>
                        <td style="width: 16px">
                            :</td>
                        <td>
            <asp:TextBox ID="txtqty" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="166px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                            &nbsp;</td>
                        <td style="width: 107px">
                            QUO REF</td>
                        <td style="width: 16px">
                            :</td>
                        <td>
            <asp:TextBox ID="txtquoref" runat="server" CssClass="btn2" ReadOnly="True" 
                Width="166px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px; height: 34px">
                        </td>
                        <td style="width: 107px; height: 34px">
                        </td>
                        <td style="width: 16px; height: 34px">
                        </td>
                        <td style="height: 34px">
                        </td>
                    </tr>
                </table>
               
            </td>
        </tr>
    <tr>
        <td class="tbl" colspan="3" style="height: 24px; text-align: left">
            <table style="width:100%;">
                <tr>
                    <td style="width: 37px">
                        &nbsp;</td>
                    <td style="width: 123px">
                        SPECIFICATION</td>
                    <td style="width: 6px">
                        :</td>
                    <td>
                                    <asp:TextBox ID="txtspecification" runat="server" Width="377px" 
                                        CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 37px">
                        &nbsp;</td>
                    <td style="width: 123px">
                        BRAND</td>
                    <td style="width: 6px">
                        :</td>
                    <td>
                                    <asp:TextBox ID="txtbrand" runat="server" Width="377px" 
                            CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 37px">
                        &nbsp;</td>
                    <td style="width: 123px">
                        ORIGIN</td>
                    <td style="width: 6px">
                        :</td>
                    <td>
                                    <asp:TextBox ID="txtorigin" runat="server" Width="377px" 
                            CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 37px">
                        &nbsp;</td>
                    <td style="width: 123px">
                        PACKING</td>
                    <td style="width: 6px">
                        :</td>
                    <td>
                                    <asp:TextBox ID="txtpacking" runat="server" Width="377px" 
                            CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 37px">
                        &nbsp;</td>
                    <td style="width: 123px">
                        UNIT PRICE</td>
                    <td style="width: 6px">
                        :</td>
                    <td>
                                    <asp:TextBox ID="txtrate" runat="server" CssClass="txtbox" Width="137px"></asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender
                                        id="FilteredTextBoxExtender3" runat="server" filtertype="Custom, Numbers" targetcontrolid="txtrate"
                                        validchars="."> </ajaxtoolkit:filteredtextboxextender>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 28px; text-align: center">
                </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 16px; text-align: center">
                &nbsp; &nbsp;&nbsp; 
            
                <asp:Button ID="btnupdate" runat="server" onclick="btnupdate_Click" 
                    Text="Update" CssClass="btn2" Width="109px" />
            
                &nbsp; &nbsp; &nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 25px; text-align: center">
            
                &nbsp;</td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 22px; text-align: left">
                
                
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 8px; text-align: center">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

