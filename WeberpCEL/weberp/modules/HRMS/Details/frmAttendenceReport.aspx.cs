using ADODB;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_HRMS_Details_frmAttendenceReport : System.Web.UI.Page
{
    string rnode = "I";
    string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"].ToString();


    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication(true);

        if (!Page.IsPostBack)
        {
            LoadCompanyByUserPermission("ADM", rnode);
            ClsDropDownListController.EnableDisableDropDownList(ddlcompany);
            ddlcompany_SelectedIndexChanged(sender, e);
            txtEmpId_AutoCompleteExtender.ContextKey = _connectionString;
            btnExport.Visible = false;
        }
    }

    private void LoadCompanyByUserPermission(string userid, string nodeid)
    {
        DataTable dt = new DataTable();
        ListItem lst;
        ddlcompany.Items.Clear();
        ddlcompany.Items.Add("");
        dt = AccessPermission.GetCompanyByUserandNodeid(_connectionString, userid, nodeid);
        foreach (DataRow dr in dt.Rows)
        {
            lst = new ListItem();
            lst.Text = dr["COMP_CODE"].ToString() + ":" + dr["COMP_NAME"].ToString();
            lst.Value = dr["COMP_CODE"].ToString();
            ddlcompany.Items.Add(lst);
        }
    }

    protected void ddlcompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dbname = ddlcompany.SelectedItem.Value.ToString();
        string constr = _connectionString;
        Session[GlobalData.sessionConnectionstring] = constr;
        Session["CompanyName"] = ddlcompany.SelectedItem.Text;
        Session["CompanyAddress"] = current.CompanyAddress.ToString();
        Session["ConnectionStr"] = constr.ToString();
        Session["db"] = dbname.ToString();
        Session["EntryUserid"] = current.UserId.Trim();
        LibraryPAY.Properties.Settings.Default["SCFConnectionString"] = constr;
        LibraryPAY.Properties.Settings.Default.Save();
        LoadDepartmentIdByuserCode("ADM", dbname.ToString(), rnode.ToString());
        ClsDropDownListController.LoadCheckBoxList(_connectionString, Sqlgenerate.SqlGetOfficeLocationIntoDDL(), chkofficelocation, "Division_Master_Name", "Division_Master_Code");
    }


    public void LoadDepartmentIdByuserCode(string userid, string companyid, string nodeid)
    {
        DataTable dt = new DataTable();
        string strSql = "";
        strSql = "  SELECT distinct DeptID, Dept FROM Emp_Details"
                      + " INNER JOIN Hrms_Emp_Mas on Emp_Details.EmpId = Hrms_Emp_Mas .Emp_Mas_Emp_Id and Emp_Mas_Term_Flg = 'N'"
                      + " Inner join tblUserCompanyDepartment on DepartmentID=Deptid"
                      + " where [UserID]='" + userid + "' and [NodeID]='" + nodeid + "' and [CompanyID]='" + companyid + "'"
                      + " ORDER BY Dept  ASC";
        dt = DataProcess.GetData(Session["ConnectionStr"].ToString(), strSql);
        if (dt.Rows.Count == 0)
        {
            strSql = "SELECT distinct DeptID, Dept FROM Emp_Details INNER JOIN Hrms_Emp_Mas on Emp_Details.EmpId = Hrms_Emp_Mas .Emp_Mas_Emp_Id and Emp_Mas_Term_Flg = 'N' ORDER BY Dept  ASC";
            dt = DataProcess.GetData(Session["ConnectionStr"].ToString(), strSql);
        }
        ddlDepartmentId.Items.Clear();
        ddlDepartmentId.Items.Insert(0, new ListItem("--- All Department ---", "-1"));
        foreach (DataRow dr in dt.Rows)
        {
            ListItem lst = new ListItem();
            lst.Value = dr["DeptID"].ToString();
            lst.Text = dr["Dept"].ToString();
            ddlDepartmentId.Items.Add(lst);
        }
    }


    private void LoadAttendanceRecords(string dateFrom, string dateTo, string departmentCode, string companyCode, string userId)
    {
        string _msg = null;
        try
        {
            var storedProcedureCommandTest = "exec [spInsertAttendanceRecordsForReport] '" + dateFrom + "','" + dateTo + "','" + departmentCode + "','" + companyCode + "','" + userId + "'";
            StoredProcedureExecutor.StoredProcedureExecuteNonQuery(Session[GlobalData.sessionConnectionstring].ToString(), storedProcedureCommandTest);

            AttendenceReport objAttendenceReport = new AttendenceReport();
            string officelocation = null;
            foreach (ListItem lst in chkofficelocation.Items)
            {
                if (lst.Selected)
                {
                    if (officelocation == null)
                    {
                        officelocation += "" + lst.Value.ToString() + "";
                    }
                    else
                    {
                        officelocation += "','" + lst.Value.ToString() + "";
                    }
                }
            }
            if (officelocation != null)
            {
                officelocation = "('" + officelocation + "')";

            }

            objAttendenceReport.OfficeLocation = officelocation;
            objAttendenceReport.Department = ddlDepartmentId.SelectedValue == "-1" ? null : ddlDepartmentId.SelectedValue;
            objAttendenceReport.EmployeeCategory = ddlEmpCategory.SelectedValue == "-1" ? null : ddlEmpCategory.SelectedValue;
            objAttendenceReport.EmployeeCode = txtEmpId.Text == string.Empty ? null : txtEmpId.Text;
            objAttendenceReport.EntryUserCode = userId;
            objAttendenceReport.FromDate = Convert.ToDateTime( dateFrom);
            objAttendenceReport.ToDate = Convert.ToDateTime( dateTo);

            AttendenceReportController objAttendenceReportController = new AttendenceReportController();
            var dtAttendance =  objAttendenceReportController.GetAttendenceRecord(_connectionString,objAttendenceReport);
            grdAttendanceRecord.DataSource = null;
            grdAttendanceRecord.DataBind();
            btnExport.Visible = false;
            if (dtAttendance.Rows.Count > 0)
            {
                grdAttendanceRecord.DataSource = dtAttendance;
                grdAttendanceRecord.DataBind();
                btnExport.Visible = true;
            }
        }
        catch (SqlException sqlError)
        {
            _msg = " Error Occured During Load Data From Database, Data did not Loaded from Database ! ";
        }
        catch (Exception inSystemExep)
        {
            _msg = " Error Occured, Data did not Loaded from Database  !";
        }
        finally
        {
            if (_msg != null)
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "MessageBox",
                    "alert(' " + _msg + " ');",
                    true);
            }
        }
    }

    private void InsertAttendanceRecordsForReport(string dateFrom, string dateTo, string departmentCode, string companyCode, string userId)
    {
        string _msg = null;
        try
        {
            var storedProcedureCommandTest = "exec [spInsertAttendanceRecordsForReport] '" + dateFrom + "','" + dateTo + "','" + departmentCode + "','" + companyCode + "','" + userId + "'";
            StoredProcedureExecutor.StoredProcedureExecuteNonQuery(Session[GlobalData.sessionConnectionstring].ToString(), storedProcedureCommandTest);
        }
        catch (SqlException sqlError)
        {
            _msg = " Error Occured During Data insert info Database ! ";
        }
        catch (Exception inSystemExep)
        {
            _msg = " Error Occured, Data did not save into Database  !";
        }
        finally
        {
            if (_msg != null)
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "MessageBox",
                    "alert(' " + _msg + " ');",
                    true);
            }
        }
    }

    protected void btnPreviewSummary_Click(object sender, EventArgs e)
    {
        if (ddlcompany.SelectedValue != "")
        {
            string dateFrom = Convert.ToDateTime(txtFromDate.SelectedDate).ToString("dd-MMM-yyyy");
            string dateTo = Convert.ToDateTime(txtToDate.SelectedDate).ToString("dd-MMM-yyyy");
            LoadAttendanceRecords(dateFrom, dateTo, ddlDepartmentId.SelectedValue, ddlcompany.SelectedValue, Session["EntryUserid"].ToString());
        }
        else
        {
            string validationMsg = "Please Select Company ! ";
            ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "MessageBox",
                    "alert(' " + validationMsg + "');",
                    true);
        }
    }


    protected void btnExport_Click(object sender, EventArgs e)
    {
        if (grdAttendanceRecord.Rows.Count != 0)
        {
            const string type = "EmployeeAttendanceReport.xls";
            ExportGridToExcel.Export(type, grdAttendanceRecord);
        }
        else
        {
            string validationMsg = "First of All Preview Summary, Then Export ! ";
            ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "MessageBox",
                    "alert(' " + validationMsg + "');",
                    true);
        }
    }


    protected void txtEmpId_TextChanged(object sender, EventArgs e)
    {
        if (txtEmpId.Text != string.Empty)
        {
            txtEmpId.Text = txtEmpId.Text.Split(':')[0].Trim() == "" ? "" : txtEmpId.Text.Split(':')[0].Trim();
        }
    }
}