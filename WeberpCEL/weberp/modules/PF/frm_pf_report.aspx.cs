using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using CrystalDecisions;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Globalization;

public partial class frm_pf_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication(true);
      //  clsStatic.MsgConfirmBox(btnshow, "Are you sure to update ? ");
        if (Page.IsPostBack == false)
        {                   
          //  tblemployee.Visible = false;         
            btnshow.Visible = true ;

            dtstdate.SelectedDate = DateTime.Now.AddDays((-1) * (DateTime.Now.Day - 1));
            dtenddate.SelectedDate = dtstdate.SelectedDate.AddMonths(1).AddDays(-1);
        }       
    }

    
    protected void btnshow_Click(object sender, EventArgs e)
    {

        LibraryDTO.clsReport rpt = new LibraryDTO.clsReport();
        ParameterFields myParams = new ParameterFields();
        rpt.SelectionFormulla = "";

        DateTime fdate = Convert.ToDateTime(dtstdate.SelectedDate.AddDays((-1) * (dtstdate.SelectedDate.Day - 1)).ToShortDateString());
       // DateTime tdate = Convert.ToDateTime(dtenddate.SelectedDate.AddMonths(1).AddDays((-1) * (dtenddate.SelectedDate.Day)).ToShortDateString());

        DateTime tdate = dtenddate.SelectedDate;

        if (rdolistreporttype.SelectedIndex == 3)
        {

            rpt.SelectionFormulla = "{view_profit_distribution.dis_hdr_date} IN DateTime('" + fdate + "') TO DateTime('" + tdate + "')";
        }

        else   if (rdolistreporttype.SelectedIndex == 4)
        {

            rpt.SelectionFormulla = "{view_profit_distribution_emp.dis_hdr_date} IN DateTime('" + fdate + "') TO DateTime('" + tdate + "')";
        }

        else if (rdolistreporttype.SelectedIndex == 5)
        {
            if (txtemployee.Text == "")
            {
                lblmessage.Text = "Please select employee";
                lblmessage.ForeColor = System.Drawing.Color.Red;
                return;
            }


            rpt.SelectionFormulla = "{view_installment_report.emp_code}='" + txtemployee.Text.Split(':')[0] + "' and {view_installment_report.install_date} IN DateTime('" + fdate + "') TO DateTime('" + tdate + "')";
        }


        else if (rdolistreporttype.SelectedIndex == 6)
        {

            rpt.SelectionFormulla = "{view_installment_report.install_date} IN DateTime('" + fdate + "') TO DateTime('" + tdate + "')";
        }


        else
        {

            if (rdolistreporttype.SelectedIndex == 0)
            {

                if (txtemployee.Text == "")
                {
                    lblmessage.Text = "Please select employee";
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

            }

            if (rdolistreporttype.SelectedIndex == 1 || rdolistreporttype.SelectedIndex == 2)
            {
                parameterpass(myParams, "@st_date", fdate.ToShortDateString());
                parameterpass(myParams, "@end_date", tdate.ToShortDateString());

            }

            else if (rdolistreporttype.SelectedIndex == 0)
            {
                parameterpass(myParams, "@st_date", fdate.ToShortDateString());
                parameterpass(myParams, "@end_date", tdate.ToShortDateString());
                parameterpass(myParams, "@emp_code", txtemployee.Text.Split(':')[0].ToString());
            }
           
        }

        parameterpass(myParams, "period", "Period : " + fdate.ToShortDateString() + " To " + tdate.ToShortDateString());
        parameterpass(myParams, "CompanyName", current.CompanyName);
        parameterpass(myParams, "CompanyAddress", current.CompanyAddress);


        rpt.ParametersFields = myParams;
        rpt.PageZoomFactor = 100;

      

        if (rdolistreporttype.SelectedIndex == 0)
        {

            rpt.FileName = "reports/rpt_pf_statement.rpt";

        }

       else if (rdolistreporttype.SelectedIndex == 1)
        {
            rpt.FileName = "reports/rpt_pf_statement_sep.rpt";         
         
        }
        else if (rdolistreporttype.SelectedIndex == 2)
        {
            rpt.FileName = "reports/rpt_pf_statement_all.rpt";     
           
        }

        else if (rdolistreporttype.SelectedIndex == 3)
        {
            rpt.FileName = "reports/PF_Distribution.rpt";

        }

        else if (rdolistreporttype.SelectedIndex == 5)
        {
            rpt.FileName = "reports/rpt_installment.rpt";

        }

        else if (rdolistreporttype.SelectedIndex == 6)
        {
            rpt.FileName = "reports/rpt_installment_all.rpt";

        }


        else
        {

            rpt.FileName = "reports/PF_Distribution2.rpt";
        }

        current.SessionReport = rpt;
        lblmessage.Text = "";

       RegisterStartupScript("click", "<script>window.open('./frm_rpt_viewer.aspx');</script>");

    }
   


    private void parameterpass(ParameterFields myParams, string pname, string   value)
    {
        ParameterField param = new ParameterField();
        ParameterDiscreteValue dis1 = new ParameterDiscreteValue();

        param.ParameterFieldName = pname;
        dis1.Value = value;
        param.CurrentValues.Add(dis1);
        myParams.Add(param);

    }

    protected void rdolistreporttype_SelectedIndexChanged(object sender, EventArgs e)
    {

        txtemployee.Text = "";

        if (rdolistreporttype.SelectedIndex == 0 || rdolistreporttype.SelectedIndex ==5 )
        {
            tblemployee.Visible = true ;         
        
        }

        else
        {          
            tblemployee.Visible = false ;
           

        }
    }
}
