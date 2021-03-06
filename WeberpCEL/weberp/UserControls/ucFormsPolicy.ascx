﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucFormsPolicy.ascx.cs" Inherits="usercontrols_ucFormsPolicy" %>
<style type="text/css">
    
     .ucbgcolorfont{       
        background-color:silver;
        font-family:'Helvetica Neue LT';
        font-size:12pt;
        
    }
     .ucColStyle{       
        background-color:silver;
        font-family:'Helvetica Neue LT';
        font-size:12pt;
        text-align-last:center;
    }
     .ucBorderStyle{       
        border-left-width:0px;
        border-right-width:0px;
        border-bottom:solid;
        border-top:solid;
        border-bottom-width:0px;
        border-top-width:thin;
        border-bottom-color:navy;
        border-top-color:navy;
        background-color:silver;
        font-family:'Helvetica Neue LT';
        
     }

  
</style>
<table style="width: 100%;background-color:white;" class="ucBorderStyle">
    <tr style="height:25px">
        <td class="ucColStyle" colspan="2" style="font-family:'Helvetica Neue LT'; color: #FF0000; font-weight: bold;">
            FORMS &amp; POLICY</td>        
    </tr>
    <tr style="height:25px">
        
        <td>
            <asp:Panel ID="pnlform" runat="server" ScrollBars="Auto" Height="300px">
            <asp:GridView ID="gdvFileLoad" runat="server" AutoGenerateColumns="false" BorderColor="LightBlue" BorderWidth="0px" onrowdatabound="gdvFileLoad_RowDataBound" onselectedindexchanged="gdvFileLoad_SelectedIndexChanged" OnRowCommand="gdvFileLoad_RowCommand" ShowHeader="false" Width="100%">
                <Columns>
                    <asp:BoundField DataField="SL" HeaderText="Sl#" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="left">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReferenceNo" HeaderText="Reference" ItemStyle-Width="150px">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FileName" HeaderStyle-HorizontalAlign="Center" HeaderText="File Name" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle Width="450px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SavedFileName" HeaderText="SavedFileName" ItemStyle-Width="150px">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDownloadAcademic" runat="server" Enabled="true" ImageUrl="~/Images/imageAttachment.jpg" CommandName="Download" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btndownload" runat="server" Enabled="true" Text="Download" CommandName="Download" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>               
            </asp:GridView>
            </asp:Panel>
        </td>
    </tr>
    
    
</table>

