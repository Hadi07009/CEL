﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryDAL.dsScfTableAdapters;
using LibraryDAL.SCBLINTableAdapters;
using LibraryDAL;
using LibraryDAL.dsMovementTableAdapters;
using LibraryDAL.dsTransportTableAdapters;
using CrystalDecisions.Web.Design;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Net.Mail;


public partial class frm_movement_monitoring_fob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication();
        if (!Page.IsPostBack)
        {
            //clsSystem usr = new clsSystem();
            //dsLinkoffice.tblUserInfoDataTable dtusr = new dsLinkoffice.tblUserInfoDataTable();
            //string userid = "MON";
            //dtusr = usr.GetUserById(userid, current.CompanyCode);
            //current.UserId = dtusr[0].UserId;
            //current.UserName = dtusr[0].UserName;
            //current.UserDepartment = dtusr[0].UserDepartment;
            //current.UserDesignation = dtusr[0].UserDesignation;
            //current.UserEmail = dtusr[0].UserEmail;
            

            dtstdate.SelectedDate = DateTime.Now;
            dtfinndate.SelectedDate = DateTime.Now.AddDays(1);

            load_criteria();
                       
        }
    }


    private void load_criteria()
    {
        
        tbl_party.Visible = false;       
        tbl_movement.Visible = false;
                
        
        switch (rdocat.SelectedIndex)
        {
            case 0:
                tbl_party.Visible = true;
                break;           
            case 1:
                tbl_movement.Visible = true;
                break;
          
            default:

                break;
        }
    }
    
    protected void btnShowPeport_Click(object sender, EventArgs e)
    {

        SaMa_Rpt_PerTableAdapter rptper = new SaMa_Rpt_PerTableAdapter();
        SCBLIN.SaMa_Rpt_PerDataTable dtrptper = new SCBLIN.SaMa_Rpt_PerDataTable();

        DateTime fdate = Convert.ToDateTime(dtstdate.SelectedDate.ToShortDateString());
        DateTime tdate = Convert.ToDateTime(dtfinndate.SelectedDate.ToShortDateString());


        LibraryDTO.clsReport rpt = new LibraryDTO.clsReport();
        ParameterFields myParams = new ParameterFields();
        string title = "";

        if (chktime.Checked)
        {
            fdate = fdate.AddHours(tssttime.Hour).AddMinutes(tssttime.Minute);
            if (tssttime.AmPm == MKB.TimePicker.TimeSelector.AmPmSpec.PM) { fdate = fdate.AddHours(12); }

            tdate = tdate.AddHours(tsendtime.Hour).AddMinutes(tsendtime.Minute);
            if (tsendtime.AmPm == MKB.TimePicker.TimeSelector.AmPmSpec.PM) { tdate = tdate.AddHours(12); }
            rpt.SelectionFormulla = "({view_fob_movement_report.tc_type} ='F' and {view_fob_movement_report.tc_status}='" + chkmotype.SelectedValue + "'  and  {view_fob_movement_report.start_datetime} in " + "datetime('" + fdate + "') to " + "datetime('" + tdate + "'))";
        }
        else
        {
            rpt.SelectionFormulla = "({view_fob_movement_report.tc_type} ='F' and {view_fob_movement_report.tc_status}='" + chkmotype.SelectedValue + "'  and  {view_fob_movement_report.start_datetime} in " + "datetime('" + fdate + "') to " + "datetime('" + tdate.AddDays(1) + "'))";
        }

        if (fdate > tdate) return;

        parameterpass(myParams, "companytitle", current.CompanyName);
        parameterpass(myParams, "companyaddress", current.CompanyAddress);

        title = "Transport Movement Monitoring/Daily Report (" + chkmotype.SelectedItem.Text + ")";

 


        switch (rdocat.SelectedIndex)
        {
            case 0:

                if (!chkpartyall.Checked)
                {
                    rpt.SelectionFormulla = rpt.SelectionFormulla + " and {view_fob_movement_report.Par_Acc_Code} in '" + txtpartyfrom.Text.Split(':')[0] + "' to '" + txtpartyto.Text.Split(':')[0] + "'";

                  
                }

                title = title + "Party Wise";
                break;
                           

            case 1:
                if (!chkmovall.Checked)
                {
                    rpt.SelectionFormulla = rpt.SelectionFormulla + " and {view_fob_movement_report.ref_no} = '" + txtmofrom.Text.Split(':')[0] + "'";
                }
                title = title + "Movement No Wise";
                break;
                         

            default:
                title = title + "Movement Date Wise";
                break;
        }



        //permission for specific user

        dtrptper = rptper.GetDataByUser(current.UserId);
        if (dtrptper.Rows.Count > 0)
        {
            string plist = "";
            foreach (SCBLIN.SaMa_Rpt_PerRow dr in dtrptper.Rows)
            {
                if (plist == "")
                {
                    plist = "'" + dr.Rpt_Per_Acc_Code + "'";
                }
                else
                {
                    plist = plist + ",'" + dr.Rpt_Per_Acc_Code + "'";
                }
            }

            rpt.SelectionFormulla = rpt.SelectionFormulla + " and ({view_fob_movement_report.Par_Acc_Code} in [" + plist + "])";

        }



        rpt.FileName = "file/fob_MovementMonitoringReport.rpt";

        parameterpass(myParams,"headline", title);

        if (chktime.Checked)
        {
            parameterpass(myParams, "period", "Period :" + fdate + " To " + tdate);

        }

        else
        {

            parameterpass(myParams, "period", "Period :" + fdate.ToShortDateString() + " To " + tdate.ToShortDateString());

        }

        parameterpass(myParams, "grpupby", rdocat.SelectedIndex.ToString());


        rpt.ParametersFields = myParams;
        rpt.PageZoomFactor = 100;
       
        current.SessionReport = rpt;


        RegisterStartupScript("click", "<script>window.open('./frm_rpt_viewer.aspx');</script>");
        

    }

    private void parameterpass(ParameterFields myParams, string pname, string value)
    {
        ParameterField param = new ParameterField();
        ParameterDiscreteValue dis1 = new ParameterDiscreteValue();

        param.ParameterFieldName = pname;
        dis1.Value = value;
        param.CurrentValues.Add(dis1);
        myParams.Add(param);

    }
   
    protected void rdocat_SelectedIndexChanged(object sender, EventArgs e)
    {
        load_criteria();
    }
}