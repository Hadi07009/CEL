using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using LibraryDTO;
using LibraryDAL;
using LibraryDAL.ErpDataSetTableAdapters;
using LibraryDAL.SCBLDataSetTableAdapters;
using LibraryDAL.SCBL2DataSetTableAdapters;
using LibraryDAL.SCBL3DataSetTableAdapters;
using LibraryDAL.SCBLQryTableAdapters;

public partial class frm_po_detailview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //current.UserId = "STM";
        //current.UserName = "STM";
        clsStatic.CheckUserAuthentication();
        tblmaster.BgColor ="FFFFFFF";
        if (!Page.IsPostBack)
        {
            tbl_data_det.Visible = false;
            tbl_po_det.Visible = false;         
            

        }

        string ref_no = Request.QueryString["po_ref_no"];
        if (ref_no == null) { return; }

        load_data(ref_no);
    }

    private void getunrealpo(string ref_no)
    {

        LibraryDAL.SCBL2DataSetTableAdapters.PuTr_PO_Det_Scbl2TableAdapter podet = new LibraryDAL.SCBL2DataSetTableAdapters.PuTr_PO_Det_Scbl2TableAdapter();
        SCBL2DataSet.PuTr_PO_Det_Scbl2DataTable podt = new SCBL2DataSet.PuTr_PO_Det_Scbl2DataTable();

        LibraryDAL.SCBL2DataSetTableAdapters.tbl_spo_advance_detTableAdapter det = new LibraryDAL.SCBL2DataSetTableAdapters.tbl_spo_advance_detTableAdapter();
        LibraryDAL.SCBL2DataSetTableAdapters.tbl_spo_advance_hdrTableAdapter hdr = new LibraryDAL.SCBL2DataSetTableAdapters.tbl_spo_advance_hdrTableAdapter();
        SCBL2DataSet.tbl_spo_advance_detDataTable dtdet = new SCBL2DataSet.tbl_spo_advance_detDataTable();
        SCBL2DataSet.tbl_spo_advance_hdrDataTable dthdr = new SCBL2DataSet.tbl_spo_advance_hdrDataTable();
        LibraryDAL.dsLinkofficeTableAdapters.tblUserInfoTableAdapter usr = new LibraryDAL.dsLinkofficeTableAdapters.tblUserInfoTableAdapter();
        LibraryDAL.dsLinkoffice.tblUserInfoDataTable dtusr = new LibraryDAL.dsLinkoffice.tblUserInfoDataTable();

        DataTable dt = new DataTable();
        string spe = "";
        tblspounreal.Visible = true;

        dtdet = det.GetDataByRef(ref_no);
        dthdr = hdr.GetDataByRef(ref_no);
        string inwd = NumerictowordClass.FNumber(dthdr[0].adv_amount.ToString("N2"));

        lblpay_date.Text = dthdr[0].app_datetime.ToShortDateString();

        lblinword.Text = inwd;
        lbltotamount.Text = dthdr[0].adv_amount.ToString("N2");
        lblpay_status.Text = dthdr[0].status;

        dtusr = usr.GetDataByUsrEmpCode(dthdr[0].adv_for_id);

        if (dtusr.Rows.Count == 0)
        {

            lbladvto.Text = dthdr[0].adv_for_det + " (" + dthdr[0].adv_for_id + ") ";
        }
        else
        {
            lbladvto.Text = dthdr[0].adv_for_det + " (" + dthdr[0].adv_for_id + ") " + dtusr[0].UserDesignation + " " + dtusr[0].UserDepartment + " ";
        }




        dt.Rows.Clear();
        dt.Columns.Clear();
        dt.Columns.Add("Sl", typeof(int));
        dt.Columns.Add("Item Name", typeof(string));
        dt.Columns.Add("Specification", typeof(string));
        dt.Columns.Add("Brand", typeof(string));
        dt.Columns.Add("Origin", typeof(string));
        dt.Columns.Add("Packing", typeof(string));
        dt.Columns.Add("UOM", typeof(string));
        dt.Columns.Add("Qty", typeof(string));
        dt.Columns.Add("Rate", typeof(string));
        dt.Columns.Add("Amount", typeof(string));


        foreach (SCBL2DataSet.tbl_spo_advance_detRow dr in dtdet.Rows)
        {

            podt = podet.GetDetByRefItem(ref_no, dr.item_code);

            if (podt.Rows.Count > 0) { spe = podt[0].PO_Det_Specification; } else { spe = ""; }
            dt.Rows.Add((int)dr.seq_no, dr.item_det, spe, dr.brand, dr.origin, dr.packing, dr.item_uom.ToString(), dr.item_qty.ToString("N2"), dr.item_rate.ToString("N2"), dr.tot_amount.ToString("N2"));
        }


        gdItem.DataSource = dt;
        gdItem.DataBind();




        // add unrealised data


    }

    private void generate_detail_data(string po_ref)
    {
        tbl_tac_logTableAdapter log = new tbl_tac_logTableAdapter();
        SCBLDataSet.tbl_tac_logDataTable dtlog = new SCBLDataSet.tbl_tac_logDataTable();

        quotation_detTableAdapter quo = new quotation_detTableAdapter();
        SCBLDataSet.quotation_detRow drq;
        PuTr_PO_Hdr_ScblTableAdapter hdr = new PuTr_PO_Hdr_ScblTableAdapter();
        PuTr_PO_Det_ScblTableAdapter det = new PuTr_PO_Det_ScblTableAdapter();
        SCBLDataSet.PuTr_PO_Det_ScblDataTable dtdet = new SCBLDataSet.PuTr_PO_Det_ScblDataTable();
        SCBLDataSet.PuTr_PO_Hdr_ScblRow hdr_dr;

        LibraryDAL.SCBL2DataSetTableAdapters.tbl_mat_rec_retTableAdapter mat = new LibraryDAL.SCBL2DataSetTableAdapters.tbl_mat_rec_retTableAdapter();
        SCBL2DataSet.tbl_mat_rec_retDataTable dtmat = new SCBL2DataSet.tbl_mat_rec_retDataTable();


        int cnt = 0;
        int gcnt, scnt, pcnt;
        string tac_ref, genstr, spestr, paystr;
        decimal tot_mrr = 0;
        hdr_dr = hdr.GetHdrDataByRef(po_ref)[0];

        lblref.Text = hdr_dr.PO_Hdr_Ref.ToString();
        lblpodate.Text = hdr_dr.PO_Hdr_DATE.ToShortDateString();
        lblreqtype.Text = hdr_dr.PO_Hdr_Code.ToString();
        tblspounreal.Visible = false;

        if (hdr_dr.PO_Hdr_Ref.ToString().Substring(0, 1) == "L")
            lblpurtype.Text = "LPO";
        else
            if (hdr_dr.PO_Hdr_Ref.ToString().Substring(0, 1) == "S")
            {
                lblpurtype.Text = "SPO";
                getunrealpo(hdr_dr.PO_Hdr_Ref.ToString());

            }
            else
                lblpurtype.Text = "FPO";

        lblparty.Text = hdr_dr.PO_Hdr_Pcode.ToString() + ": " + hdr_dr.PO_Hdr_Com1.ToString();
        lblamount.Text = hdr_dr.PO_Hdr_Value.ToString("N2");
        lblinward.Text = NumerictowordClass.FNumber(hdr_dr.PO_Hdr_Value.ToString("N2"));
        lblstatus.Text = hdr_dr.PO_Hdr_Status;
              

        // add detail data;

        celdetail.Controls.Clear();
        dtdet = det.GetDetByRef(hdr_dr.PO_Hdr_Ref);

        foreach (SCBLDataSet.PuTr_PO_Det_ScblRow det_dr in dtdet.Rows)
        {
            cnt++;

            ClientSide_modules_commercial_usercontrols_ctl_po_item_mrr_view ctldet = (ClientSide_modules_commercial_usercontrols_ctl_po_item_mrr_view)LoadControl("./usercontrols/ctl_po_item_mrr_view.ascx");

            Label lblsl = (Label)ctldet.FindControl("lblsl");
            Label lblproduct = (Label)ctldet.FindControl("lblproduct");
            Label lblrate = (Label)ctldet.FindControl("lblrate");
            Label lblqty = (Label)ctldet.FindControl("lblqty");
            Label lbliamount = (Label)ctldet.FindControl("lbliamount");
            Label lbliinward = (Label)ctldet.FindControl("lbliinward");

            LinkButton lnkmpr = (LinkButton)ctldet.FindControl("lnkmprref");
            LinkButton lnkcs = (LinkButton)ctldet.FindControl("lnkcsref");

            HtmlTableCell celspe = (HtmlTableCell)ctldet.FindControl("celspe");
            HtmlTableCell celbrand = (HtmlTableCell)ctldet.FindControl("celbrand");
            HtmlTableCell celorigin = (HtmlTableCell)ctldet.FindControl("celorigin");
            HtmlTableCell celpacking = (HtmlTableCell)ctldet.FindControl("celpacking");
            GridView gr = (GridView)ctldet.FindControl("gdItem");

            ctldet.ID = "celdetail_" + celdetail.Controls.Count.ToString();

            lblsl.Text = cnt.ToString() + ".";
            lblproduct.Text = det_dr.PO_Det_Icode.ToString() + ": " + det_dr.PO_Det_Itm_Desc.ToString();
            lblrate.Text = det_dr.PO_Det_Lin_Rat.ToString("N2");
            lblqty.Text = det_dr.PO_Det_Lin_Qty.ToString("N2");
            lbliamount.Text = det_dr.PO_Det_Lin_Amt.ToString("N2");
            lbliinward.Text = NumerictowordClass.FNumber(det_dr.PO_Det_Lin_Amt.ToString("N2"));

            lnkmpr.Text = det_dr.PO_Det_Pr_Ref;
            lnkmpr.Attributes.Add("onclick ", "window.open('./frm_mpr_lifecycle.aspx?ref_no=" + lnkmpr.Text + "&itm_code=" + det_dr.PO_Det_Icode.ToString() + "')");

            lnkcs.Text = det_dr.PO_Det_Quo_Ref;
            lnkcs.Attributes.Add("onclick ", "window.open('./frm_quo_audit.aspx?qref=" + lnkcs.Text + "&mpr_ref=" + lnkmpr.Text + "&icode=" + det_dr.PO_Det_Icode.ToString() + "')");

            if (lblpurtype.Text == "LPO")
            {
                drq = quo.GetDataByRefParty(det_dr.PO_Det_Quo_Ref, hdr_dr.PO_Hdr_Dcode.ToString())[0];
                celspe.InnerText = drq.specification;
                celbrand.InnerText = drq.product_brand;
                celorigin.InnerText = drq.origin;
                celpacking.InnerText = drq.packing;
            }

            DataTable dt = new DataTable();
            dt.Columns.Clear();
            dt.Columns.Add("REF NO", typeof(string));
            dt.Columns.Add("QTY", typeof(string));
            dt.Columns.Add("RATE", typeof(string));
            dt.Columns.Add("AMOUNT", typeof(string));
            dt.Columns.Add("BRAND", typeof(string));
            dt.Columns.Add("ORIGIN", typeof(string));
            dt.Columns.Add("PACKING", typeof(string));
            dt.Columns.Add("DATE TIME", typeof(DateTime));

            dtmat = new SCBL2DataSet.tbl_mat_rec_retDataTable();
            dtmat = mat.GetDataByPorefSl(po_ref, det_dr.PO_Det_Lno);


            foreach (SCBL2DataSet.tbl_mat_rec_retRow dtr in dtmat.Rows)
            {
                switch (dtr.trn_type)
                {
                    case "OK":

                        break;
                    case "INSPECTION":

                        break;
                    case "CONFIRM":
                        tot_mrr += dtr.itm_rec_ret_qty * dtr.po_line_rate;
                        dt.Rows.Add(dtr.trn_ref_no, dtr.itm_rec_ret_qty.ToString("N2"), dtr.po_line_rate.ToString("N2"), (dtr.itm_rec_ret_qty * dtr.po_line_rate).ToString("N2"), dtr.brand, dtr.origin, dtr.packing, dtr.trn_datetime);
                        break;
                    default:

                        break;

                }


            }

            gr.DataSource = dt;
            gr.DataBind();

            celdetail.Controls.Add(ctldet);
        }
                      
        genstr = "";
        spestr = "";
        paystr = "";
        gcnt = 0;
        scnt = 0;
        pcnt = 0;
        tac_ref = hdr_dr.PO_Hdr_Ref.ToString();

        dtlog = log.GetDataByRef(tac_ref);

        foreach (SCBLDataSet.tbl_tac_logRow drlog in dtlog.Rows)
        {
            switch (drlog.tac_type)
            {
                case "gen":
                    {
                        gcnt++;
                        genstr = genstr + gcnt.ToString() + ". " + drlog.content_det.ToString() + "<br />";
                        break;
                    }

                case "spe":
                    {
                        scnt++;
                        spestr = spestr + scnt.ToString() + ". " + drlog.content_det.ToString() + "<br />";
                        break;
                    }

                case "pay":
                    {
                        pcnt++;
                        paystr = paystr + pcnt.ToString() + ". " + drlog.content_det.ToString() + "<br />";
                        break;
                    }

            }
        }
        celgent.InnerHtml = genstr;
        celspet.InnerHtml = spestr;
        celpayt.InnerHtml = paystr;

    }
   
    


    protected void load_data(string selpo)
    {
        
        PuTr_PO_Hdr_ScblTableAdapter hdr = new PuTr_PO_Hdr_ScblTableAdapter();
        if (hdr.GetHdrDataByRef(selpo).Rows.Count == 0) return;
        tbl_data_det.Visible = true;
        tbl_po_det.Visible = true;
        generate_detail_data(selpo);
            

    }

  
    
    
}

