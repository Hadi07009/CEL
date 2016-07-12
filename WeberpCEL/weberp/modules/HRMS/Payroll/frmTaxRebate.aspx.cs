using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class modules_HRMS_Payroll_frmTaxRebate : System.Web.UI.Page
{
    readonly string _connectionString = System.Configuration.ConfigurationManager.AppSettings["UbasysConnectionString"];
    TaxRebate _objTaxRebate;
    TaxRebateController _objTaxRebateController;
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
                GetTaxRebateRecord();
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
            ActionForTaxRebateData();
            GetTaxRebateRecord();
            ClearAllControl();
            MessageBox1.ShowSuccess("Data saved Successful");

        }
        catch (Exception msgException)
        {

            MessageBox1.ShowError(msgException.Message);
        }
    }

    private void ActionForTaxRebateData()
    {
        try
        {
            _objTaxRebate = new TaxRebate();
            _objTaxRebate.FinancialYear = ddlYear.SelectedValue;
            _objTaxRebate.FromDate = Convert.ToDateTime(txtFromDate.Text);
            _objTaxRebate.Slab = Convert.ToInt32(ddlSlabNumber.SelectedItem.Value);
            _objTaxRebate.SlabAmount = Convert.ToDecimal(txtSlabAmount.Text);
            _objTaxRebate.AmountUpto = Convert.ToDecimal( txtAmountUpto.Text);
            _objTaxRebate.SlabType = ddlGender.SelectedValue == "-1" ? null : ddlGender.SelectedValue;
            _objTaxRebate.TaxRate = Convert.ToSingle(txtTaxRate.Text);
            _objTaxRebate.ToDate = Convert.ToDateTime(txtToDate.Text);
            _objTaxRebateController = new TaxRebateController();
            if (btnSave.Text == "Save")
            {
                _objTaxRebateController.Save(_connectionString, _objTaxRebate);
            }
            else
            {
                _objTaxRebate.ReferenceNumber = Session["refNumber"].ToString();
                _objTaxRebateController.Update(_connectionString, _objTaxRebate);
            }

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }

    }
    private void GetTaxRebateRecord()
    {
        _objTaxRebateController = new TaxRebateController();
        _objTaxRebate = new TaxRebate();
        _objTaxRebate.SlabType = ddlGender.SelectedValue == "-1" ? null : ddlGender.SelectedValue;
        _objTaxRebate.FinancialYear = ddlYear.SelectedValue;
        var dtTaxRebate = _objTaxRebateController.GetTaxRebateRecord(_connectionString,_objTaxRebate);
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
            GetTaxRebateRecord();

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
                _objTaxRebateController = new TaxRebateController();
                _objTaxRebate = new TaxRebate();
                _objTaxRebate.ReferenceNumber = lblreferenceNumber;
                _objTaxRebateController.Delete(_connectionString, _objTaxRebate);
                GetTaxRebateRecord();

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
                var lblslabAmount = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblslabAmount")).Text;
                var lbltaxRate = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lbltaxRate")).Text;
                var lblAmountUpto = ((Label)grdSlabRecord.Rows[selectedIndex].FindControl("lblAmountUpto")).Text;
                ddlYear.SelectedValue = lblfinancialYear;
                ddlGender.SelectedValue = lblslabType;
                txtFromDate.Text = lblfromDate;
                txtToDate.Text = lbltoDate;
                ddlSlabNumber.SelectedValue = lblslab;
                txtSlabAmount.Text = lblslabAmount;
                txtTaxRate.Text = lbltaxRate;
                txtAmountUpto.Text = lblAmountUpto;
                btnSave.Text = "Update";
                Session["refNumber"] = lblreferenceNumber;
                ddlYear.Enabled = false;
                ddlGender.Enabled = false;
                ddlSlabNumber.Enabled = false;

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
        ddlSlabNumber.SelectedIndex = 0;
        txtSlabAmount.Text = string.Empty;
        txtAmountUpto.Text = string.Empty;
        txtTaxRate.Text = string.Empty;
        ddlYear.Enabled = true;
        ddlGender.Enabled = true;
        ddlSlabNumber.Enabled = true;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearAllControl();

    }
    protected void grdSlabRecord_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[2].Visible = false;
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SetFinancialPeriod(ddlYear.SelectedValue);
            GetTaxRebateRecord();

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