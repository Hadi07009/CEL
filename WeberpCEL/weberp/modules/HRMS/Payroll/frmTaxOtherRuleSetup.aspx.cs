using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class modules_HRMS_Payroll_frmTaxOtherRuleSetup : System.Web.UI.Page
{
    readonly string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"];
    TaxOtherRoles _objTaxOtherRoles;
    TaxOtherRolesController _objTaxOtherRolesController;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            txtFromDate.Attributes.Add("readonly", "readonly");
            txtToDate.Attributes.Add("readonly", "readonly");
            if (!Page.IsPostBack)
            {
                LoadYear();
                SetFinancialPeriod(ddlYear.SelectedValue);
                GetTaxOtherRolesRecord();
            }

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void LoadYear()
    {
        ddlYear.DataSource = GenerateASetOfYear();
        ddlYear.DataValueField = "yearId";
        ddlYear.DataTextField = "yearName";
        ddlYear.DataBind();
        ddlYear.SelectedValue = DateTime.Now.Year.ToString();
    }

    private DataTable GenerateASetOfYear()
    {
        DataTable dtYear = new DataTable();
        dtYear.Columns.Add("yearId", typeof(string));
        dtYear.Columns.Add("yearName", typeof(string));

        for (int i = DateTime.Now.Year - 1; i < DateTime.Now.Year + 10; i++)
        {
            DataRow drNew = dtYear.NewRow();
            drNew["yearId"] = i.ToString() + "-" + (i+1).ToString();
            drNew["yearName"] = i.ToString() + "-" + (i + 1).ToString();
            dtYear.Rows.Add(drNew);
        }
        return dtYear;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            ActionForTaxOtherRoles();
            GetTaxOtherRolesRecord();
            ClearAllControl();
            MessageBox1.ShowSuccess("Data saved Successful");

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void ActionForTaxOtherRoles()
    {
        try
        {
            _objTaxOtherRoles = new TaxOtherRoles();
            _objTaxOtherRoles.FinancialYear = ddlYear.SelectedValue;
            _objTaxOtherRoles.FromDate = Convert.ToDateTime(txtFromDate.Text);
            _objTaxOtherRoles.Slab = 1;
            _objTaxOtherRoles.SlabAmount = Convert.ToDecimal(txtMinTaxAmount.Text);            
            _objTaxOtherRoles.SlabType = ddlGender.SelectedValue == "-1" ? null : ddlGender.SelectedValue;
            _objTaxOtherRoles.TaxRate = Convert.ToSingle(txtTaxDeductionPercentage.Text);
            _objTaxOtherRoles.InvestmentLimitPercentage = Convert.ToSingle( txtInvestmentLimitPercentage.Text);
            _objTaxOtherRoles.ToDate = Convert.ToDateTime(txtToDate.Text);
            _objTaxOtherRolesController = new TaxOtherRolesController();
            if (btnSave.Text == "Save")
            {
                _objTaxOtherRolesController.Save(_connectionString, _objTaxOtherRoles);
            }
            else
            {
                _objTaxOtherRoles.ReferenceNumber = Session["refNumber"].ToString();
                _objTaxOtherRolesController.Update(_connectionString, _objTaxOtherRoles);
            }

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }

    }
    private void GetTaxOtherRolesRecord()
    {
        _objTaxOtherRolesController = new TaxOtherRolesController();
        _objTaxOtherRoles = new TaxOtherRoles();
        _objTaxOtherRoles.SlabType = ddlGender.SelectedValue == "-1" ? null : ddlGender.SelectedValue;
        _objTaxOtherRoles.FinancialYear = ddlYear.SelectedValue;
        var dtTaxRebate = _objTaxOtherRolesController.GetTaxRebateRecord(_connectionString,_objTaxOtherRoles);
        grdSlabRecord.DataSource = null;
        grdSlabRecord.DataBind();
        if (dtTaxRebate.Rows.Count > 0)
        {
            grdSlabRecord.DataSource = dtTaxRebate;
            grdSlabRecord.DataBind();
            
        }

    }
    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GetTaxOtherRolesRecord();

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }
    protected void grdSlabRecord_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        var selectedIndex = Convert.ToInt32(e.CommandArgument.ToString());
        var lblreferenceNumber = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblreferenceNumber")).Text;
        if (e.CommandName.Equals("Delete"))
        {
            try
            {
                _objTaxOtherRolesController = new TaxOtherRolesController();
                _objTaxOtherRoles = new TaxOtherRoles();
                _objTaxOtherRoles.ReferenceNumber = lblreferenceNumber;
                _objTaxOtherRolesController.Delete(_connectionString, _objTaxOtherRoles);
                GetTaxOtherRolesRecord();

            }
            catch (Exception msgException)
            {

                ScriptManager.RegisterStartupScript( this,GetType(),"MessageBox","alert(' " + msgException.Message + " ');",true);
            }
        }
        else if (e.CommandName.Equals("Select"))
        {
            try
            {
                var lblfinancialYear = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblfinancialYear")).Text;
                var lblslabType = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblslabType")).Text;
                var lblfromDate = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblfromDate")).Text;
                var lbltoDate = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lbltoDate")).Text;
                var lblslab = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblslab")).Text;
                var lblMinTaxAmount = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblMinTaxAmount")).Text;
                var lblInvestMentLimitPercentage = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblInvestMentLimitPercentage")).Text;
                var lblTaxDeductionPercentage = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblTaxDeductionPercentage")).Text;
                ddlYear.SelectedValue = lblfinancialYear;
                ddlGender.SelectedValue = lblslabType;
                txtFromDate.Text = lblfromDate;
                txtToDate.Text = lbltoDate;
                txtMinTaxAmount.Text = lblMinTaxAmount;
                txtTaxDeductionPercentage.Text = lblTaxDeductionPercentage;
                txtInvestmentLimitPercentage.Text = lblInvestMentLimitPercentage;
                btnSave.Text = "Update";
                Session["refNumber"] = lblreferenceNumber;
                ddlYear.Enabled = false;
                ddlGender.Enabled = false;
            }
            catch (Exception msgException)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "MessageBox", "alert(' " + msgException.Message + " ');", true);
            }
        }
    }
    protected void grdSlabRecord_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    private void ClearAllControl()
    {
        btnSave.Text = "Save";                
        txtMinTaxAmount.Text = string.Empty;        
        txtTaxDeductionPercentage.Text = string.Empty;
        txtInvestmentLimitPercentage.Text = string.Empty;
        ddlYear.Enabled = true;
        ddlGender.Enabled = true;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearAllControl();

    }
    protected void grdSlabRecord_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[6].Visible = false;
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SetFinancialPeriod(ddlYear.SelectedValue);
            GetTaxOtherRolesRecord();

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void SetFinancialPeriod(string financialYear)
    {
        txtFromDate.Text = "1/07/" + financialYear.Split('-')[0].Trim() ;
        txtToDate.Text = "30/06/" + financialYear.Split('-')[1].Trim();
    }
}