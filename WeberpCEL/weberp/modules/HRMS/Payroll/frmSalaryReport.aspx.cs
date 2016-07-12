using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_HRMS_Payroll_frmSalaryReport : System.Web.UI.Page
{
    string rnode = "f";
    readonly string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"];
    private SalaryReport _objSalaryReport;
    private SalaryReportController _objSalaryReportController;
    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication(true);
        try
        {
            if (!Page.IsPostBack)
            {
                LoadCompanyByUserPermission("ADM", rnode);
                ClsDropDownListController.EnableDisableDropDownList(ddlcompany);
                ClsDropDownListController.LoadCheckBoxList(_connectionString, Sqlgenerate.SqlGetOfficeLocationIntoDDL(), chkofficelocation, "Division_Master_Name", "Division_Master_Code");
                txtEmployeeCode_AutoCompleteExtender.ContextKey = _connectionString;
                GetDepartmentCode();

            }

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }

    }
    private void GetDepartmentCode()
    {
        try
        {
            DataTable dt = new DataTable();
            CommonMethods objCommonMethods = new CommonMethods();
            dt = objCommonMethods.LoadDepartmentIdByuserCode(_connectionString, "ADM", ddlcompany.SelectedValue, rnode.ToString());
            ddlDepartmentId.Items.Clear();
            ddlDepartmentId.Items.Add("ALL");
            foreach (DataRow dr in dt.Rows)
            {
                ListItem lst = new ListItem();
                lst.Value = dr["DeptID"].ToString();
                lst.Text = dr["Dept"].ToString();
                ddlDepartmentId.Items.Add(lst);
            }

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    private void LoadCompanyByUserPermission(string userid, string nodeid)
    {
        try
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
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    protected void txtEmployeeCode_TextChanged(object sender, EventArgs e)
    {
        if (txtEmployeeCode.Text != string.Empty)
        {
            txtEmployeeCode.Text = txtEmployeeCode.Text.Split(':')[0].Trim() == "" ? "" : txtEmployeeCode.Text.Split(':')[0].Trim();
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            ShowSalaryInformationDetails();

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void ShowSalaryInformationDetails()
    {
        try
        {
            string officelocation = null;
            _objSalaryReport = new SalaryReport();
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

            _objSalaryReport.OfficeLocation = officelocation;

            _objSalaryReport.Department = ddlDepartmentId.SelectedValue == "ALL" ? null : ddlDepartmentId.SelectedValue;
            _objSalaryReport.EmployeeCategory = ddlEmpCategory.SelectedValue == "-1" ? null : ddlEmpCategory.SelectedValue;
            _objSalaryReport.EmployeeCode = txtEmployeeCode.Text == string.Empty ? null : txtEmployeeCode.Text;

            _objSalaryReportController = new SalaryReportController();
            DataTable dtSalaryRecordDetails = _objSalaryReportController.GetSalaryRecord(_connectionString, _objSalaryReport);
            grdSalaryReport.DataSource = null;
            grdSalaryReport.DataBind();
            btnExporttoExcelDetails.Visible = false;
            if (dtSalaryRecordDetails.Rows.Count > 0)
            {
                grdSalaryReport.DataSource = dtSalaryRecordDetails;
                grdSalaryReport.DataBind();
                btnExporttoExcelDetails.Visible = true;
            }

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    protected void btnExporttoExcelDetails_Click(object sender, EventArgs e)
    {
        const string type = "Salary_Information_Report.xls";
        ExportGridToExcel.Export(type, grdSalaryReport);
    }
}