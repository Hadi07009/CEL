﻿using ADODB;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class modules_HRMS_Details_frmDependentReport : System.Web.UI.Page
{
    string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"].ToString();
    private const string Rnode = "K";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            clsStatic.CheckUserAuthentication(true);

            LoadCompanyByUserPermission("ADM", Rnode);
            ClsDropDownListController.EnableDisableDropDownList(ddlcompany);
            ddlcompany_SelectedIndexChanged(sender, e);

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void LoadCompanyByUserPermission(string userid, string nodeid)
    {
        try
        {
            DataTable dt = new DataTable();
            ListItem lst;
            ddlcompany.Items.Clear();
            dt = AccessPermission.GetCompanyByUserandNodeid(_connectionString, userid, nodeid);
            if (dt.Rows.Count > 0)
            {
                ddlcompany.Items.Insert(0, new ListItem("--- Please Select ---", "-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    lst = new ListItem();
                    lst.Text = dr["COMP_CODE"].ToString() + ":" + dr["COMP_NAME"].ToString();
                    lst.Value = dr["COMP_CODE"].ToString();
                    ddlcompany.Items.Add(lst);
                }
            }
            else
            {
                ddlcompany.Items.Insert(0, new ListItem("--- No Data Found ---", "-1"));
            }

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }
    }


    private void parameterpass(ParameterFields myParams, string pname, string value)
    {
        try
        {
            ParameterField param = new ParameterField();
            ParameterDiscreteValue dis1 = new ParameterDiscreteValue();
            param.ParameterFieldName = pname;
            dis1.Value = value;
            param.CurrentValues.Add(dis1);
            myParams.Add(param);

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }
    }

    private void ShowReport(string selectionfor, string parameter, string reportname)
    {
        try
        {
            clsReport rpt = new clsReport();
            ParameterFields myParams = new ParameterFields();
            ConnectionInfo ConnInfo = new ConnectionInfo();
            string SCFconnStr = Session[GlobalData.sessionConnectionstring].ToString();
            string[] ff;
            string[] ss;
            string[] prm;
            prm = parameter.Split(';');
            if (prm.Length > 0)
            {
                for (int i = 0; i < prm.Length; i++)
                {
                    parameterpass(myParams, prm[i].Split(':')[0].ToString(), prm[i].Split(':')[1].ToString());
                }
            }
            ff = SCFconnStr.Split('=');
            ss = ff[1].Split(';');
            ConnInfo.ServerName = ss[0];
            ss = ff[2].Split(';');
            ConnInfo.DatabaseName = ss[0];
            ss = ff[3].Split(';');
            ConnInfo.UserID = ss[0];
            ss = ff[4].Split(';');
            ConnInfo.Password = ss[0];
            rpt.FileName = reportname;
            rpt.ConnectionInfo = ConnInfo;
            rpt.ParametersFields = myParams;
            rpt.SelectionFormulla = selectionfor;
            Session[GlobalData.sessionReportDet] = rpt;
            RegisterStartupScript("click", "<script>window.open('./frm_report_viewer.aspx');</script>");

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }
    }


    protected void btnBankAccountReport_Click(object sender, EventArgs e)
    {
        try
        {
            DataProcess.ExecuteQuery(_connectionString, "if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[view_dependent_report]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[view_dependent_report]");
            string sql = @"create view [dbo].[view_dependent_report] as
                        select Emp_Details.*,HrMs_Emp_mas.Emp_Mas_Join_Date,HrMs_Emp_mas.Emp_Mas_MaritalStatus,HrMs_Emp_mas.Emp_Mas_DOB,
                        Hrms_Dpdnt_Mas.Dpdnt_Empid,Hrms_Dpdnt_Mas.Dpdnt_Name,Hrms_Dpdnt_Mas.Dpdnt_Relation,Hrms_Dpdnt_Mas.Dpdnt_DOB,
                        Hrms_Dpdnt_Mas.Dpdnt_Gender,[dbo].[GetAgebyDOB](Hrms_Dpdnt_Mas.Dpdnt_DOB) as Age 
                        from Emp_Details  
                        inner join HrMs_Emp_mas  on HrMs_Emp_mas.Emp_Mas_Emp_Id=Emp_Details.EmpID 
                        left outer join Hrms_Dpdnt_Mas on HrMs_Emp_mas.Emp_Mas_Emp_Id =Hrms_Dpdnt_Mas.Dpdnt_Empid";
            DataProcess.ExecuteQuery(_connectionString, sql);
            string selectionfor, parameter;
            selectionfor = "";
            string CompanyName = "CompanyName" + ":" + Session["CompanyName"].ToString().Split(':')[1].ToString();
            string CompanyAddress = "CompanyAddress" + ":" + Session["CompanyAddress"].ToString();
            parameter = CompanyName + ";" + CompanyAddress;
            string reportname = "../Reports/DependentReport.rpt";
            ShowReport(selectionfor, parameter, reportname);

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    protected void ddlcompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dbname = ddlcompany.SelectedItem.Value;
        if (dbname != "-1")
        {
            var constr = ConfigurationSettings.AppSettings["SCFConnectionString"].Replace("SCF", dbname);
            Session[GlobalData.sessionConnectionstring] = constr;
            Session["CompanyName"] = ddlcompany.SelectedItem.Text;
            Session["CompanyAddress"] = current.CompanyAddress;
            Session["ConnectionStr"] = constr.ToString();
            Session["db"] = dbname.ToString();
        }

    }
}