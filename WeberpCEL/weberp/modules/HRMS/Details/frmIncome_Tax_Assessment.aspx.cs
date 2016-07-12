using ADODB;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using LibraryPF.dsMasterDataTableAdapters;

public partial class modules_HRMS_Details_frmIncome_Tax_Assessment : System.Web.UI.Page
{
    string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"].ToString();
    private const string Rnode = "K";
    protected void Page_Load(object sender, EventArgs e)
    {
        clsStatic.CheckUserAuthentication(true);

        if (!IsPostBack)
        {
            LoadCompanyByUserPermission("ADM", Rnode);
            ClsDropDownListController.EnableDisableDropDownList(ddlcompany);
            txtemployeeSearch_AutoComplxtender.ContextKey = _connectionString;
            btnExporttoExcel.Visible = false;

        }
    }
    private void LoadCompanyByUserPermission(string userid, string nodeid)
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
    protected void btnView_Click(object sender, EventArgs e)
    {
        try
        {
            ShowIncomeTaxAssessment();
        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void ShowIncomeTaxAssessment()
    {
        IncomeTaxAssessment objIncomeTaxAssessment = new IncomeTaxAssessment();
        objIncomeTaxAssessment.FromDate = Convert.ToDateTime( txtFromDate.Text);
        objIncomeTaxAssessment.ToDate = Convert.ToDateTime(txtToDate.Text);
        objIncomeTaxAssessment.EmployeeCode = txtemployeeSearch.Text == string.Empty ? null : txtemployeeSearch.Text;
        IncomeTaxAssessmentController objIncomeTaxAssessmentController = new IncomeTaxAssessmentController();
        var dtTaxAssessmentRecord = objIncomeTaxAssessmentController.GetRecord(_connectionString,objIncomeTaxAssessment);
        grdTaxAssesment.DataSource = null;
        grdTaxAssesment.DataBind();
        btnExporttoExcel.Visible = false;
        if (dtTaxAssessmentRecord.Rows.Count > 0)
        {
            grdTaxAssesment.DataSource = dtTaxAssessmentRecord;
            grdTaxAssesment.DataBind();
            btnExporttoExcel.Visible = true;
            
        }
    }
    protected void txtemployeeSearch_TextChanged(object sender, EventArgs e)
    {
        if (txtemployeeSearch.Text != string.Empty)
        {
            txtemployeeSearch.Text =  txtemployeeSearch.Text.Split(':')[0].Trim();
        }
    }
    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        if (grdTaxAssesment.Rows.Count != 0)
        {
            const string type = "Income Tax Assessment.xls";
            ExportGridToExcel.Export(type, grdTaxAssesment);
        }
        else
        {
            MessageBox1.ShowInfo("There is no data for Export ! ");
        }
    }
    private decimal basicPay = 0;
    private decimal overTime = 0;
    private decimal leaveFareAssistance = 0;
    private decimal incentiveBonus = 0;
    private decimal festivalBonus = 0;
    private decimal providentFund = 0;
    private decimal totalPart1 = 0;
    private decimal houseRentAllowance = 0;
    private decimal conveyanceAllowance = 0;
    private decimal medicalAllowance = 0;
    private decimal foodAllowance = 0;
    private decimal otherAllowance = 0;
    private decimal totalPart2 = 0;
    protected void grdTaxAssesment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var lblBasic = ((Label)e.Row.FindControl("lblBasic")).Text == string.Empty ? 0 :Convert.ToDecimal(  ((Label)e.Row.FindControl("lblBasic")).Text);
            var lblOverTime = ((Label)e.Row.FindControl("lblOverTime")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblOverTime")).Text);
            var lblLeaveFareAssistance = ((Label)e.Row.FindControl("lblLeaveFareAssistance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblLeaveFareAssistance")).Text);
            var lblIncentiveBonus = ((Label)e.Row.FindControl("lblIncentiveBonus")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblIncentiveBonus")).Text);
            var lblFestivalBonus = ((Label)e.Row.FindControl("lblFestivalBonus")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblFestivalBonus")).Text);
            var lblProvidentFund = ((Label)e.Row.FindControl("lblProvidentFund")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblProvidentFund")).Text);
            var lblTotalPart1 = ((Label)e.Row.FindControl("lblTotalPart1")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblTotalPart1")).Text);
            var lblHouseRentAllowance = ((Label)e.Row.FindControl("lblHouseRentAllowance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblHouseRentAllowance")).Text);
            var lblConveyanceAllowance = ((Label)e.Row.FindControl("lblConveyanceAllowance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblConveyanceAllowance")).Text);
            var lblMedicalAllowance = ((Label)e.Row.FindControl("lblMedicalAllowance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblMedicalAllowance")).Text);
            var lblFoodAllowance = ((Label)e.Row.FindControl("lblFoodAllowance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblFoodAllowance")).Text);
            var lblOtherAllowance = ((Label)e.Row.FindControl("lblOtherAllowance")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblOtherAllowance")).Text);
            var lblTotalPart2 = ((Label)e.Row.FindControl("lblTotalPart2")).Text == string.Empty ? 0 : Convert.ToDecimal(((Label)e.Row.FindControl("lblTotalPart2")).Text);
            basicPay += lblBasic ;
            overTime += lblOverTime;
            leaveFareAssistance += lblLeaveFareAssistance;
            incentiveBonus += lblIncentiveBonus;
            festivalBonus += lblFestivalBonus;
            providentFund += lblProvidentFund;
            totalPart1 += lblTotalPart1;
            houseRentAllowance += lblHouseRentAllowance;
            conveyanceAllowance += lblConveyanceAllowance;
            medicalAllowance += lblMedicalAllowance;
            foodAllowance += lblFoodAllowance;
            otherAllowance += lblOtherAllowance;
            totalPart2 += lblTotalPart2;
 
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            ((Label)e.Row.FindControl("lblFooterBasic")).Text = basicPay.ToString();
            ((Label)e.Row.FindControl("lblFooterOverTime")).Text = overTime.ToString();
            ((Label)e.Row.FindControl("lblFooterLeaveFareAssistance")).Text = leaveFareAssistance.ToString();
            ((Label)e.Row.FindControl("lblFooterIncentiveBonus")).Text = incentiveBonus.ToString();
            ((Label)e.Row.FindControl("lblFooterFestivalBonus")).Text = festivalBonus.ToString();
            ((Label)e.Row.FindControl("lblFooterProvidentFund")).Text = providentFund.ToString();
            ((Label)e.Row.FindControl("lblFooterTotalPart1")).Text = totalPart1.ToString();
            ((Label)e.Row.FindControl("lblFooterHouseRentAllowance")).Text = houseRentAllowance.ToString();
            ((Label)e.Row.FindControl("lblFooterConveyanceAllowance")).Text = conveyanceAllowance.ToString();
            ((Label)e.Row.FindControl("lblFooterMedicalAllowance")).Text = medicalAllowance.ToString();
            ((Label)e.Row.FindControl("lblFooterFoodAllowance")).Text = foodAllowance.ToString();
            ((Label)e.Row.FindControl("lblFooterOtherAllowance")).Text = otherAllowance.ToString();
            ((Label)e.Row.FindControl("lblFooterTotalPart2")).Text = totalPart2.ToString();
        }
    }
}