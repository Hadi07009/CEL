using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modules_HRMS_Payroll_frmSalaryFormat : System.Web.UI.Page
{
    readonly string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"];
    private SalaryFormatController _objSalaryFormatController;
    private SalaryFormat _objSalaryFormat;
    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication(true);

    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            ShowSalaryRecord();

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void ShowSalaryRecord()
    {
        try
        {
            _objSalaryFormatController = new SalaryFormatController();
            _objSalaryFormat = new SalaryFormat();
            _objSalaryFormat.TargetDate = Convert.ToDateTime( popupTargetDate.Text);
            var dtSalaryRecord = _objSalaryFormatController.GetRecord(_connectionString,_objSalaryFormat);
            grdSalaryFormat.DataSource = null;
            grdSalaryFormat.DataBind();
            btnExporttoExcelDetails.Visible = false;
            if (dtSalaryRecord.Rows.Count > 0)
            {
                grdSalaryFormat.DataSource = dtSalaryRecord;
                grdSalaryFormat.DataBind();
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
        const string type = "Salary_Format.xls";
        ExportGridToExcel.Export(type, grdSalaryFormat);
    }
}