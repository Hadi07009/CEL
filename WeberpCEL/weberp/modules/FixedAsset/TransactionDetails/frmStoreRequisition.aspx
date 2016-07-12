<%@ Page Title="" Language="C#" MasterPageFile="~/masMain.master" AutoEventWireup="true" CodeFile="frmStoreRequisition.aspx.cs" Inherits="frmStoreRequisition" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:UpdatePanel ID= "upd" runat="server">
    <ContentTemplate>
    <asp:Panel ID="PanelLeaveHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
        <asp:Label ID="lblleave" Text="Store Requisition (SR)" runat="server" />
    </asp:Panel>   
    <table style="width:100%; text-align:left">
                
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>                         
                     <td>
                         &nbsp;</td>
                 </tr>
                
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         <asp:UpdatePanel ID="updtPnl" runat="server">
                         <ContentTemplate>
                         <div align="center">
                         <asp:Panel ID="pnlSrchHdr" runat="server" CssClass="cpHeaderContent" Width="100%">
                            <asp:Label ID="Label1" Text="Search SR" runat="server" />
                         </asp:Panel>
                         <asp:Panel ID="pnlSrchDet" runat="server" CssClass="cpBodyContent" Width="99%" 
                                 Height="70px">
                             <table width="100%">
                <tr>
                    <td class="auto-style16" >
                        <asp:Label ID="Label2" runat="server" Text="Search SR "></asp:Label>
                        
                    </td>
                    <td class="auto-style17">:</td>
                    <td class="auto-style11" >
                        <asp:TextBox ID="txtSrSearch" Width="400px" runat="server" autoComplete="off" 
                            AutoPostBack="True" ontextchanged="txtItem_TextChanged"></asp:TextBox>                    
                        <cc1:AutoCompleteExtender ID="txtSrSearch_AutoCompleteExtenderSr" runat="server" 
                            BehaviorID="AutoCompleteExSr" CompletionInterval="100" 
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                            CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                            DelimiterCharacters="," EnableCaching="false" MinimumPrefixLength="3" 
                            ServiceMethod="GetInvSrListAll" 
                            ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                            ShowOnlyCurrentWordInCompletionListItem="true" 
                            TargetControlID="txtSrSearch">
                        </cc1:AutoCompleteExtender>
                    </td>   
                    <td class="auto-style12">
                        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" Text="Search" Width="100px" />
                    </td>    
                    <td class="auto-style13">
                    <asp:Button ID="btnClear" runat="server"  Text="Clear" 
                            Width="100px" onclick="btnClear_Click" Visible="False" />
                    </td>                
                    <td>
                        &nbsp;<asp:Label ID="lblEditFlag" runat="server" Text="N" Visible="False"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
                                 <tr>
                                     <td class="auto-style16" >
                                         &nbsp;</td>
                                     <td class="auto-style17">&nbsp;</td>
                                     <td align="left" class="auto-style11" >
                                         <asp:Button ID="btnPrint" runat="server" onclick="btnPrint_Click" 
                                             Text="Print" Visible="False" Width="100px" />
                                     </td>
                                     <td class="auto-style12">
                                         &nbsp;</td>
                                     <td class="auto-style13">
                                         &nbsp;</td>
                                     <td>
                                         &nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style16" >&nbsp;</td>
                                     <td class="auto-style17">&nbsp;</td>
                                     <td align="center" class="auto-style11" >&nbsp;</td>
                                     <td class="auto-style12">&nbsp;</td>
                                     <td class="auto-style13">&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
            </table>  
                         </asp:Panel>
                         <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtenderSrch" runat="server" 
                            TargetControlID="pnlSrchDet" 
                            CollapseControlID="pnlSrchHdr" 
                            ExpandControlID="pnlSrchHdr"
                            Collapsed="true" 
                            TextLabelID="Label1" 
                            CollapsedText="Search SR" 
                            ExpandedText="Search SR"
                            CollapsedSize="0"
                            ExpandedSize="70"
                            AutoCollapse="False"
                            AutoExpand="False"
                            ScrollContents="false"
                            ImageControlID="Image1"
                            ExpandedImage="~/images/collapse.jpg"
                            CollapsedImage="~/images/expand.jpg"
                            ExpandDirection="Vertical" 
                            >
                            </cc1:CollapsiblePanelExtender>
                          <br />
                         </div>
                         <div align="center">
                         <asp:Panel ID="pHeaderText" runat="server" CssClass="cpHeaderContent" Width="100%">
                            <asp:Label ID="lblText" Text="Header" runat="server" />
                         </asp:Panel>
                         <asp:Panel ID="pHdrBody" runat="server" CssClass="cpBodyContent" Width="99%" 
                                 Height="370px">
                            <table width="100%">
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="Label3" runat="server" Text="Requisition Type"></asp:Label>
                    </td>
                    <td >:</td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="cboReqType" runat="server" Width="405px" 
                            onselectedindexchanged="cboReqType_SelectedIndexChanged" 
                            AutoPostBack="True">
                        <asp:ListItem Text="------Select-------" Value="------Select-------"></asp:ListItem>
                        <asp:ListItem Text="Required for Client" Value="SR"></asp:ListItem>
                        <asp:ListItem Text="Required for Backbone" Value="SRB"></asp:ListItem>
                        <asp:ListItem Text="Required for Link3" Value="SRL"></asp:ListItem>
                        </asp:DropDownList>
                    </td>   
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="cboReqType" ErrorMessage="Select Required For" 
                            Operator="NotEqual" SetFocusOnError="True" ValidationGroup="HdrGrp" 
                            ValueToCompare="------Select-------"></asp:CompareValidator>
                    </td>
                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        <asp:Label ID="Label4" runat="server" Text="Required For"></asp:Label>
                                    </td>
                                    <td >: </td>
                                    <td class="auto-style18">
                                        <asp:TextBox ID="txtReqFor" runat="server" Width="400px" 
                                            ontextchanged="txtReqFor_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="AutoCompleteExtenderClient" runat="server" 
                                        BehaviorID="AutoCompleteExClient" CompletionInterval="100" 
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                                        CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                                        DelimiterCharacters="," EnableCaching="false" MinimumPrefixLength="1" 
                                        ServiceMethod="GetInventoryClientListAll" UseContextKey="true" ContextKey="Client"
                                        ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                                        ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtReqFor">
                                        </cc1:AutoCompleteExtender>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtReqFor" ErrorMessage="Enter Required For" 
                                            SetFocusOnError="True" ValidationGroup="HdrGrp"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                            ControlToValidate="txtReqFor" Display="Dynamic" 
                                            ErrorMessage="Req. For does not exists" 
                                            OnServerValidate="CustomValidator3_ServerValidate" SetFocusOnError="True" 
                                            ToolTip="Please select a different Client" ValidationGroup="HdrGrp"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        <asp:Label ID="Label5" runat="server" Text="Location ID"></asp:Label>
                                    </td>
                                    <td >:</td>
                                    <td class="auto-style18">
                                        <asp:TextBox ID="txtLocation" runat="server" AutoPostBack="True" 
                                            ontextchanged="txtLocation_TextChanged" Width="400px"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="AutoCompleteExtenderLoc" runat="server" 
                                            BehaviorID="AutoCompleteExLoc" CompletionInterval="100" 
                                            CompletionListCssClass="autocomplete_completionListElement" 
                                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                                            CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                                            ContextKey="Client" DelimiterCharacters="," EnableCaching="false" 
                                            MinimumPrefixLength="1" ServiceMethod="GetInvLocListAll" 
                                            ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                                            ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtLocation" 
                                            UseContextKey="true">
                                        </cc1:AutoCompleteExtender>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="txtLocation" ErrorMessage="Enter Location ID" 
                                            SetFocusOnError="True" ValidationGroup="HdrGrp"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:CustomValidator ID="CustomValidator5" runat="server" 
                                            ControlToValidate="txtLocation" Display="Dynamic" 
                                            ErrorMessage="Location ID does not exists" 
                                            OnServerValidate="CustomValidator5_ServerValidate" SetFocusOnError="True" 
                                            ToolTip="Please select a different Location" ValidationGroup="HdrGrp"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        <asp:Label ID="Label6" runat="server" Text="Reason"></asp:Label>
                                    </td>
                                    <td >:</td>
                                    <td class="auto-style18">
                                        <asp:DropDownList ID="cboIssueType" runat="server" Width="405px" 
                                            onselectedindexchanged="cboIssueType_SelectedIndexChanged" 
                                            AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                            ControlToValidate="cboIssueType" ErrorMessage="Select Reason" 
                                            Operator="NotEqual" SetFocusOnError="True" ValidationGroup="HdrGrp" 
                                            ValueToCompare="------Select-------"></asp:CompareValidator>
                                    </td>
                                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="Label7" runat="server" Text="Requisition By"></asp:Label>
                    </td>
                    <td >:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtReqBy" runat="server" Width="400px" AutoPostBack="True" 
                            ontextchanged="txtReqBy_TextChanged"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="AutoCompleteExtenderReqBy" runat="server" 
                        BehaviorID="AutoCompleteExReqBy" CompletionInterval="100" 
                        CompletionListCssClass="autocomplete_completionListElement" 
                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                        CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                        DelimiterCharacters="," EnableCaching="false" MinimumPrefixLength="1" 
                        ServiceMethod="GetEmployeeListAll" UseContextKey="true" ContextKey="Emp"
                        ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                        ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtReqBy">
                        </cc1:AutoCompleteExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtReqBy" ErrorMessage="Enter Requisition By" 
                                ValidationGroup="HdrGrp"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CustomValidator ID="CustomValidator4" runat="server" 
                                ControlToValidate="txtReqBy" ErrorMessage="Employee does not exists" 
                                OnServerValidate="CustomValidator4_ServerValidate" SetFocusOnError="True" 
                                ToolTip="Please select a different Employee" ValidationGroup="HdrGrp"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="Label9" runat="server" Text="Required Date"></asp:Label>
                    </td>
                    <td >: </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtRequiredDate" runat="server" Width="400px" 
                            AutoPostBack="True" ontextchanged="txtRequiredDate_TextChanged"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtRequiredDate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtRequiredDate" ErrorMessage="Enter Required Date" 
                                ValidationGroup="HdrGrp"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                ControlToValidate="txtRequiredDate" ErrorMessage="Enter Valid Date" 
                                Operator="DataTypeCheck" ToolTip="Enter Valid Date" Type="Date" 
                                ValidationGroup="HdrGrp"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="Label10" runat="server" Text="Priority"></asp:Label>
                    </td>
                    <td >:</td>
                    <td class="auto-style18">
                        <asp:DropDownList ID="cboPriority" runat="server" Width="405px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" 
                            ControlToValidate="cboPriority" ErrorMessage="Select Priority" 
                            Operator="NotEqual" SetFocusOnError="True" ValidationGroup="HdrGrp" 
                            ValueToCompare="------Select-------"></asp:CompareValidator>
                    </td>
                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        <asp:Label ID="Label11" runat="server" Text="Remarks"></asp:Label>
                                    </td>
                                    <td >: </td>
                                    <td class="auto-style18">
                                        <asp:TextBox ID="txtRemarks" runat="server" Width="400px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style15">
                                        &nbsp;</td>
                                    <td ></td>
                                    <td align="left" class="auto-style18">
                                        <asp:Button ID="btnNext" runat="server" onclick="btnNext_Click" Text="Next" 
                                            ValidationGroup="HdrGrp" Width="100px" Visible="False" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTkiNo" runat="server" AutoPostBack="True" ontextchanged="txtTkiNo_TextChanged" Visible="False" Width="400px"></asp:TextBox>
                                        <asp:Label ID="Label8" runat="server" Text="TKI No" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style15">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="left" class="auto-style18">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
            </table>  
                         </asp:Panel>
                         <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtenderHdr" runat="server" 
                            TargetControlID="pHdrBody" 
                            CollapseControlID="pHeaderText" 
                            ExpandControlID="pHeaderText"
                            Collapsed="false" 
                            TextLabelID="lblText" 
                            CollapsedText="Show Header" 
                            ExpandedText="Hide Header"
                            CollapsedSize="0"
                            ExpandedSize="370"
                            AutoCollapse="False"
                            AutoExpand="False"
                            ScrollContents="false"
                            ImageControlID="Image1"
                            ExpandedImage="~/images/collapse.jpg"
                            CollapsedImage="~/images/expand.jpg"
                            ExpandDirection="Vertical" 
                            >
                            </cc1:CollapsiblePanelExtender>
                         </div>  
                         <br />
                         <div align="center">
                         <asp:Panel ID="pDetailsText" runat="server" CssClass="cpHeaderContent" Width="100%">
                            <asp:Label ID="lblDetText" Text="Details" runat="server" />
                         </asp:Panel>
                         <asp:Panel ID="pDetBody" runat="server" CssClass="cpBodyContent" Width="99%" 
                                 Height="350px">
                         <table width="100%">
                                <tr>
                                    <td class="auto-style14">
                                        &nbsp;</td>
                                    <td >
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="lblerrormsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td width="600">
                                            &nbsp;</td>                    
                                </tr>
                                                  <tr>
                                                      <td class="auto-style14">
                                                          <asp:Label ID="Label12" runat="server" Text="Item"></asp:Label>
                                                      </td>
                                                      <td >
                                                          :
                                                      </td>
                                                      <td  class="auto-style18">
                                                          <asp:TextBox ID="txtItem" runat="server" AutoPostBack="True" 
                                                              ontextchanged="txtItem_TextChanged" Width="400px"></asp:TextBox>
                                                          <cc1:AutoCompleteExtender ID="autoComplete1" runat="server" 
                                                              BehaviorID="AutoCompleteEx2" CompletionInterval="100" 
                                                              CompletionListCssClass="autocomplete_completionListElement" 
                                                              CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                                                              CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                                                              DelimiterCharacters="," EnableCaching="false" MinimumPrefixLength="1" 
                                                              ServiceMethod="GetInvItem" 
                                                              ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                                                              ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtItem">
                                                          </cc1:AutoCompleteExtender>
                                                      </td>
                                                      <td>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                              ControlToValidate="txtItem" ErrorMessage="Enter Valid Item" 
                                                              SetFocusOnError="True" ValidationGroup="DetGrp"></asp:RequiredFieldValidator>
                                                          <br />
                                                          <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                                              ControlToValidate="txtItem" Display="Dynamic" 
                                                              ErrorMessage="Item does not exists" 
                                                              OnServerValidate="CustomValidator2_ServerValidate" SetFocusOnError="True" 
                                                              ToolTip="Please select a different Item" ValidationGroup="DetGrp"></asp:CustomValidator>
                                                      </td>
                                                  </tr>
                                <tr>
                                    <td class="auto-style14">
                                        <asp:Label ID="Label13" runat="server" Text="UOM"></asp:Label>
                                    </td>
                                    <td >
                                        :
                                    </td>
                                    <td  class="auto-style18">
                                        <asp:TextBox ID="txtUom" runat="server" ReadOnly="True" BackColor="#CCCCCC" 
                                            Width="400px"></asp:TextBox>
                                    </td>                    
                                </tr>
                                <tr>
                                    <td class="auto-style14">
                                        <asp:Label ID="Label14" runat="server" Text="Store"></asp:Label>
                                    </td>
                                    <td >
                                        :</td>
                                    <td  class="auto-style18">
                                        <asp:TextBox ID="txtStore" runat="server"  
                                            AutoPostBack="True" Width="400px" ontextchanged="txtStore_TextChanged"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="txtStore_AutoCompleteExtender" runat="server" 
                                            BehaviorID="AutoCompleteExStore" CompletionInterval="100" 
                                            CompletionListCssClass="autocomplete_completionListElement" 
                                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                                            CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                                            DelimiterCharacters="," EnableCaching="false" MinimumPrefixLength="1" 
                                            ServiceMethod="GetInvStoreList" 
                                            ServicePath="~/modules/FixedAsset/services/InvAutoComplete.asmx" 
                                            ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtStore">
                                        </cc1:AutoCompleteExtender>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="txtStore" ErrorMessage="Enter Valid Store" 
                                                ValidationGroup="DetGrp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                ControlToValidate="txtStore" Display="Dynamic" 
                                                ErrorMessage="Store does not exists" 
                                                OnServerValidate="CustomValidator1_ServerValidate" 
                                                ToolTip="Please select a different Store" ValidationGroup="DetGrp" 
                                                SetFocusOnError="True"></asp:CustomValidator>
                                    </td>
                                </tr>
                                                  <tr>
                                                      <td class="auto-style14">
                                                          <asp:Label ID="Label15" runat="server" Text="Current Stock"></asp:Label>
                                                      </td>
                                                      <td >
                                                          :</td>
                                                      <td  class="auto-style18">
                                                          <asp:TextBox ID="txtCurrentStock" runat="server" BackColor="#CCCCCC" 
                                                              ReadOnly="True" Width="400px"></asp:TextBox>
                                                      </td>
                                                      <td>
                                                          &nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                      <td class="auto-style14">
                                                          <asp:Label ID="Label16" runat="server" Text="Quantity"></asp:Label>
                                                      </td>
                                                      <td >
                                                          :
                                                      </td>
                                                      <td  class="auto-style18">
                                                          <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="True" Width="400px"></asp:TextBox>
                                                      </td>
                                                      <td>
                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                              ControlToValidate="txtQuantity" ErrorMessage="Enter Item Quantity" 
                                                              ValidationGroup="DetGrp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                          <br />
                                                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                              ControlToValidate="txtQuantity" ErrorMessage="Enter Valid Quantity" 
                                                              Operator="DataTypeCheck" Type="Double" ValidationGroup="DetGrp" 
                                                              SetFocusOnError="True"></asp:CompareValidator>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td class="auto-style14" >
                                                          &nbsp;</td>
                                                      <td >
                                                          &nbsp;</td>
                                                      <td align="left">
                                                          <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" 
                                                              Width="100px" ValidationGroup="DetGrp" />
                                                          <asp:Label ID="lblministk" runat="server" Visible="False"></asp:Label>
                                                      </td>
                                                      <td>
                                                          &nbsp;</td>
                                                  </tr>
                                <tr>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td align="left">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>   
                         </asp:Panel>
                         <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtenderDet" runat="server" 
                            TargetControlID="pDetBody" 
                            CollapseControlID="pDetailsText" 
                            ExpandControlID="pDetailsText"
                            Collapsed="true" 
                            TextLabelID="lblDetText" 
                            CollapsedText="Show Details" 
                            ExpandedText="Hide Details"
                            CollapsedSize="0"
                            ExpandedSize="350"
                            AutoCollapse="False"
                            AutoExpand="False"
                            ScrollContents="false"
                            ImageControlID="Image1"
                            ExpandedImage="~/images/collapse.jpg"
                            CollapsedImage="~/images/expand.jpg"
                            ExpandDirection="Vertical" 
                            >
                            </cc1:CollapsiblePanelExtender>
                         </div>
                         <br />
                         <div align="center">                         
                             <asp:GridView ID="gvSR" runat="server" BackColor="White" 
                                 BorderColor="#32A545" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
                                 ForeColor="#333333" 
                                 onselectedindexchanged="GridView1_SelectedIndexChanged" Font-Names="Arial" 
                                 Font-Size="10pt" Width="100%" HeaderStyle-HorizontalAlign="Left">
                                 <Columns>
                                     <asp:CommandField SelectText="Remove" ShowSelectButton="True" 
                                         ButtonType="Image" SelectImageUrl="~/Images/remove.png">
                                         <ItemStyle ForeColor="Red" HorizontalAlign="Left" />
                                     </asp:CommandField>
                                 </Columns>
                             </asp:GridView>
                             <br />
                             <span>
                             <asp:Button ID="btnHold" runat="server" onclick="btnHold_Click" Text="Hold" 
                                  Width="100px" Visible="False" />
                                  &nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnPost" runat="server" Text="Post" Width="100px" 
                    onclick="btnPost_Click" Visible="False" />
                    </span>
                         </div>
                         <br />
                         <asp:Panel ID="Panel1" runat="server" Style="border-right: black 2px solid; padding-right: 20px;
                     border-top: black 2px solid; display: none; padding-left: 20px; padding-bottom: 20px;
                     border-left: black 2px solid; padding-top: 20px; border-bottom: black 2px solid;
                     background-color: white" Width="340px">
                    <table id="tblPopUp" runat="server" style="width: 328px">
                 <tr>
                     <td style="height: 21px" align="center" colspan="3">
                         <asp:Label ID="lblMsgHdr" runat="server"></asp:Label>
                     </td>
                 </tr>
                        <tr>
                            <td style="width: 151px; height: 21px">
                            </td>
                            <td style="height: 21px">
                            </td>
                            <td style="height: 21px">
                            </td>
                        </tr>
                 <tr>
                     <td style="width: 151px" align="right">
                         Store Requisition No</td>
                     <td>
                         :</td>
                     <td>
                         <asp:TextBox ID="txtSrRef" runat="server" ReadOnly="true" Enabled="false"  BorderStyle="None"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td style="width: 151px">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td colspan="3" style="height: 18px; text-align: center">
                         </td>
                 </tr>
             </table>             
                    <div style="text-align: center">
                        <asp:Button ID="btnOk" runat="server"  Text="Ok"   Width="58px" />                        
                    </div>
                    </asp:Panel>
         
                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="modalBackground"
                        CancelControlID="btnOk"  PopupControlID="Panel1" TargetControlID="btnOk">
                    </cc1:ModalPopupExtender>  
                         </ContentTemplate>
                         <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="txtQuantity" EventName="TextChanged"/>
                         
                         </Triggers>                                      
                         </asp:UpdatePanel>
                         </td>                         
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
    <style type="text/css">  
            .cpHeader
            {
            color: white;
            background-color: #719DDB;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 12px;
            cursor: pointer;
            width:450px;
            height:18px;
            padding: 4px;           
            }
            .cpBody
            {
            background-color: #DCE4F9;
            font: normal 11px auto Verdana, Arial;
            border: 1px gray;               
            padding-top: 2px;
            overflow : hidden;
            padding-left: 4px;
            padding-right: 4px;
            padding-bottom: 4px;
        }
        .style1
        {
            width: 71px;
        }
        .style2
        {
            width: 276px;
        }
        .style3
        {
            width: 125px;
        }
        .auto-style11 {
            width: 409px;
        }
        .auto-style12 {
            width: 116px;
        }
        .auto-style13 {
            width: 118px;
        }
        .auto-style14 {
            width: 111px;
        }
        .auto-style15 {
            width: 111px;
        }
        .auto-style16 {
            width: 111px;
        }
        .auto-style17 {
            width: 9px;
        }
        .auto-style18 {
            width: 413px;
        }
    </style>   
        
    </ContentTemplate> 
 
      <Triggers>  
     
       </Triggers>
       
      </asp:UpdatePanel>                                
     </asp:Content>