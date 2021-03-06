<%@ Page Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frm_purchase_requisition.aspx.cs" Inherits="frm_purchase_requisition" Title=""    ValidateRequest="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  Runat="Server">

     <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                <asp:Label ID="lblleave" Text="PURCHASE REQUISITION" runat="server" />
            </asp:Panel>
    <table class="tblmas" style="width: 100%" id="tblmaster" runat="server">
        <tr>
            <td class="tbl" colspan="3" style="height: 24px; text-align: left">
                <table style="width: 954px">
                    <tr>
                        <td style="width: 77px">
                            Req Type</td>
                        <td style="width: 16px">
                            :</td>
                        <td style="width: 348px">
                            CTMPR</td>
                        <td style="width: 53px">
                            &nbsp;</td>
                        <td style="width: 8px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 77px; height: 7px;">
                            Date</td>
                        <td style="width: 16px; height: 7px;">
                            :</td>
                        <td style="width: 348px; height: 7px;">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="txtbox" ReadOnly="True" 
                                Width="380px"></asp:TextBox>
                            </td>
                        <td style="width: 53px; height: 7px;">
                            </td>
                        <td style="width: 8px; height: 7px;">
                            </td>
                        <td style="height: 7px">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 77px">
                            Dept </td>
                        <td style="width: 16px">
                            :</td>
                        <td style="width: 348px">
                            <asp:DropDownList ID="ddldept" runat="server" Width="385px" 
                                onselectedindexchanged="ddlUnit_SelectedIndexChanged">
                            </asp:DropDownList></td>
                        <td style="width: 53px">
                            &nbsp;</td>
                        <td style="width: 8px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 77px">
                            Remarks</td>
                        <td style="width: 16px">
                            :</td>
                        <td style="width: 348px">
                            <asp:TextBox ID="txtcomm" runat="server" CssClass="txtbox" Width="380px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 53px">
                            &nbsp;</td>
                        <td style="width: 8px">
                            &nbsp;</td>
                        <td>
                <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
               
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="text-align: center">
               
               <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="2px" CssClass="tbl"
                    DefaultButton="btncancel" Height="200px" ScrollBars="Auto" Style="border-right: black 2px solid;
                    padding-right: 20px; border-top: black 2px solid; text-align:center; padding-left: 20px; display:none;
                    padding-bottom: 20px; border-left: black 2px solid; padding-top: 20px; border-bottom: black 2px solid;
                    background-color: white"  Width="354px" HorizontalAlign="Center">
                    <div  style="border-color: #e6e6fa; border-width: 1px; text-align:center; filter: progid:dximagetransform.microsoft.gradient(endcolorstr='white', startcolorstr='#D6DCF9', gradienttype='0');
                        width: 98%; height: 177px; text-align: center; ">
                        &nbsp;&nbsp;
                        <table id="tblmsg" runat="server" style="width: 95%" 
                            align="center">
                        <tr>
                            <td colspan="1" style="width: 364px; height: 18px; text-align: center">
                                <span style="color: #ff0000"><strong>&nbsp;REQUISITION CREATED SUCCESSFULLY</strong></span></td>
                        </tr>
                        <tr>
                            <td style="width: 364px; height: 13px">
                            </td>
                        </tr>
                            <tr>
                                <td style="width: 364px; text-align: center;">
                                    REQ REF NO:</td>
                            </tr>
                        <tr>
                            <td style="width: 364px; text-align: center">
                          <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>
                                &nbsp;<asp:Label ID="lblporef" runat="server" Font-Bold="True" Width="162px"></asp:Label>
                                <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                    </td>
                        </tr>
                        <tr>
                            <td colspan="1" style="height: 19px; width: 364px;">
                            </td>
                        </tr>
                            <tr>
                                <td colspan="1" style="width: 364px; height: 29px; text-align: center">
                                    <asp:Button ID="btncancel" runat="server" Width="0px" Height="0px" 
                                        CssClass="hdn" />
                                    <asp:Button ID="btnok" runat="server" CssClass="btn2" OnClick="btnok_Click" Text="OK"
                                        Width="102px" /></td>
                            </tr>
                    </table>
                    </div>
                </asp:Panel>
                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender5" runat="server" DisplayModalPopupID="ModalPopupExtender5"
                    TargetControlID="Button1">
                </ajaxToolkit:ConfirmButtonExtender>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender5" runat="server" BackgroundCssClass="modalBackground"
                    CancelControlID="btncancel" PopupControlID="Panel4" TargetControlID="Button1">
                </ajaxToolkit:ModalPopupExtender>
               
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 52px; text-align: left">
           <%-- <asp:UpdatePanel ID="update" runat="server">
                        <ContentTemplate>--%>
                <asp:GridView ID="gdItem" runat="server" BackColor="White" BorderColor="#41519A" style="border-top-width: 1px; border-left-width: 1px; border-left-color: #e6e6fa; filter: progid:dximagetransform.microsoft.gradient(endcolorstr='white', startcolorstr='#D6DCF9', gradienttype='0'); border-bottom-width: 1px; border-bottom-color: #e6e6fa; border-top-color: #e6e6fa; border-right-width: 1px; border-right-color: #e6e6fa;"
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                    
                    PageSize="100" SkinID="GridView" Width="95%" 
                                OnSelectedIndexChanged="gdItem_SelectedIndexChanged">
                    <FooterStyle BackColor="#41519A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#41519A" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle Font-Bold="True" />
                    <HeaderStyle BackColor="#41519A" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="Lavender" Font-Size="8pt" 
                        Font-Underline="False" />
                    <Columns>
                        <asp:CommandField SelectText="Remove" ShowSelectButton="True" >
                            <ItemStyle ForeColor="Red" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle Font-Size="8pt" />
                </asp:GridView>                   
                        <asp:UpdateProgress ID="sp1" runat="server">
                        <ProgressTemplate>
                           <%--<div class="TransparentGrayBackground"> </div>--%>
                            <asp:Panel  ID="alwaysVisibleAP" runat="server" style="text-align: center" >
                            
                                <div style="text-align: center">
                                    <asp:Image  ID="ajaxLoadNotificationImage" 
                                                runat="server" 
                                                ImageUrl="~/images/Loading.gif" 
                                                AlternateText="[image]" />
                                    
                                </div>
                            
                            </asp:Panel>
                            <ajaxToolKit:AlwaysVisibleControlExtender 
                                ID="AlwaysVisibleControlExtender" 
                                runat="server"
                                TargetControlID="alwaysVisibleAP"
                                HorizontalSide="Center"
                                HorizontalOffset="0"
                                VerticalSide="Middle"
                                VerticalOffset="0">
                            </ajaxToolKit:AlwaysVisibleControlExtender>
                           
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                <%-- </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                            
                        </Triggers>
                        
              
                    </asp:UpdatePanel>--%>
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 25px; text-align: center">
           <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn2" Text="SUBMIT" Width="119px" Visible="False" OnClick="btnSubmit_Click" />
                <td>
    
</td>
                <%-- </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                    </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 8px; text-align: left" bgcolor="whitesmoke">
           <%-- <asp:UpdatePanel ID="updsub" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>--%>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 92px;  height: 23px;">
                        </td>
                        <td style="width: 10px; height: 23px;">
                        </td>
                        <td style="height: 23px">
                        
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text="Label" 
                                Visible="False" Width="300px"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            Item</td>
                        <td style="width: 10px">
                            :</td>
                        <td style="height: 20px">                       
                            <asp:TextBox ID="txtitem" runat="server" autocomplete="off" Width="380px"></asp:TextBox>
                            <ajaxToolkit:AutoCompleteExtender
                                runat="server"                                
                                ID="autoComplete1" 
                                BehaviorID="AutoCompleteEx2"                                
                                TargetControlID="txtitem"
                                ServicePath="services/autocomplete.asmx" 
                                ServiceMethod="GetItemListforrec"
                                MinimumPrefixLength="1" 
                                CompletionInterval="1000"
                                EnableCaching="false"
                                CompletionSetCount="20"                                 
                                CompletionListCssClass ="autocomplete_completionListElement"                            
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                DelimiterCharacters=","
                                ShowOnlyCurrentWordInCompletionListItem="true" > 
                            </ajaxToolkit:AutoCompleteExtender>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            Store</td>
                        <td style="width: 10px">
                            :</td>
                        <td>
                            <asp:DropDownList ID="ddlstore" runat="server" CssClass="txtbox" Width="385px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px; height: 20px">
                            Quantity</td>
                        <td style="width: 10px; height: 20px">
                            :</td>
                        <td style="height: 20px">
                         
                            <asp:TextBox ID="txtqty" runat="server" CssClass="txtbox"
                                AutoCompleteType="Disabled" Width="380px"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtqty_FilteredTextBoxExtender" 
                                runat="server" FilterType="Custom, Numbers" TargetControlID="txtqty" 
                                ValidChars=".">
                            </ajaxToolkit:FilteredTextBoxExtender>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px; height: 20px">
                            Specification</td>
                        <td style="width: 10px; height: 20px">
                            :</td>
                        <td style="height: 20px">
                            <asp:TextBox ID="txtspecification" runat="server" CssClass="txtbox" 
                                Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px; height: 20px">
                            Brand</td>
                        <td style="width: 10px; height: 20px">
                            :</td>
                        <td style="height: 20px">
                            <asp:TextBox ID="txtbrand" runat="server" CssClass="txtbox" Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px; height: 20px">
                            Origin</td>
                        <td style="width: 10px; height: 20px">
                            :</td>
                        <td style="height: 20px">
                            <asp:TextBox ID="txtorigin" runat="server" CssClass="txtbox" Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px; height: 20px">
                            Packing</td>
                        <td style="width: 10px; height: 20px">
                            :</td>
                        <td style="height: 20px">
                            <asp:TextBox ID="txtpacking" runat="server" CssClass="txtbox" Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            ETR</td>
                        <td style="width: 10px">
                            :</td>
                        <td>
                            <ew:CalendarPopup ID="cldetr" runat="server" 
                                Culture="English (United Kingdom)" DisableTextBoxEntry="False" Width="150px">
                                <ButtonStyle CssClass="btn2" />
                            </ew:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            Nature of Expenditure</td>
                        <td style="width: 10px">
                            :</td>
                        <td>
                            <asp:DropDownList ID="ddlnoe" runat="server" CssClass="txtbox" Width="385px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            Location of Use</td>
                        <td style="width: 10px">
                            :</td>
                        <td>
                            <asp:TextBox ID="txtlocation" runat="server" CssClass="txtbox" Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            Remarks</td>
                        <td style="width: 10px">
                            :</td>
                        <td>
                            <asp:TextBox ID="txtremarks" runat="server" CssClass="txtbox" Width="380px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                            &nbsp;</td>
                        <td style="width: 10px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 92px">
                        </td>
                        <td style="width: 10px">
                    
                        </td>
                        <td>                            
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn2" Text="Add" Width="141px" OnClick="btnAdd_Click" />
                           
                            </td>
                            
                    </tr>
                </table>
              <%--   </ContentTemplate>
            </asp:UpdatePanel>
            --%>
            </td>
        </tr>
        <tr>
            <td class="tbl" colspan="3" style="height: 8px; text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 73px">
            </td>
            
            <td style="height: 73px; text-align: center">
                &nbsp;&nbsp;
            </td>
            <td style="height: 73px">
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

