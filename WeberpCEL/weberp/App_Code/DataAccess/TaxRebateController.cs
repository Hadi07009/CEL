using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxRebateController
/// </summary>
public class TaxRebateController
{
	public TaxRebateController()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void Save(string connectionString, TaxRebate objTaxRebate)
    {
        try
        {
            if (CheckTaxRebateRecord(connectionString, objTaxRebate) > 0)
            {
                throw new Exception("Tax rebate exist. ");

            }
            string sql = null;
            sql = @"declare @sl int,@refnumber varchar(10)
	            set @sl=(select isnull(max(RIGHT(referenceNumber,5)),0)+1 as sl from TaxRebate) 
	            set @refnumber=STUFF('00000',6-LEN(@sl),20,@sl)
                INSERT INTO TaxRebate 
		        (
		        referenceNumber,
		        financialYear,
		        fromDate,
		        toDate,
		        slabType,
		        slab,
		        AmountFrom,
		        RebateRate,
                AmountUpto
		        ) 
		        VALUES 
		        (
		        @refnumber,
		        '" + objTaxRebate.FinancialYear + "',CONVERT(DATETIME, '" + objTaxRebate.FromDate + "',103),CONVERT(DATETIME, '" + objTaxRebate.ToDate + "',103),'" + objTaxRebate.SlabType + "'," + objTaxRebate.Slab + "," + objTaxRebate.SlabAmount + "," + objTaxRebate.TaxRate + ","+objTaxRebate.AmountUpto+")";
            DataProcess.InsertQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public void Update(string connectionString, TaxRebate objTaxRebate)
    {
        try
        {
            string sql = null;
            sql = @"UPDATE TaxRebate
		    SET
            financialYear	=	ISNULL('" + objTaxRebate.FinancialYear + "',financialYear),	fromDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxRebate.FromDate + "',103),fromDate)," +
            " toDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxRebate.ToDate + "',103),toDate),slabType	=	ISNULL('" + objTaxRebate.SlabType + "',slabType),slab	=	ISNULL(" + objTaxRebate.Slab + ",slab), " +
            " AmountFrom	=	ISNULL(" + objTaxRebate.SlabAmount + ",AmountFrom),	RebateRate	=	ISNULL(" + objTaxRebate.TaxRate + ",RebateRate), AmountUpto	=	ISNULL(" + objTaxRebate.AmountUpto + ",AmountUpto) WHERE	referenceNumber= '" + objTaxRebate.ReferenceNumber + "'";
            DataProcess.UpdateQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public DataTable GetTaxRebateRecord(string connectionString, TaxRebate objTaxRebate)
    {
        try
        {
            string sql = null;
            DataTable dtTaxRebate = new DataTable();
            sql = @"SELECT a.referenceNumber,
		    a.financialYear,
		    a.fromDate,
		    a.toDate,
		    a.slabType,
		    b.genderText,
		    a.slab,
		    a.AmountFrom,
		    a.RebateRate,
            a.AmountUpto FROM TaxRebate a 
		    LEFT JOIN HRMS_Emp_Gender b ON a.slabType = b.genderCode WHERE a.financialYear = '" + objTaxRebate.FinancialYear + "'";
            if (objTaxRebate.SlabType != null)
            {
                sql = sql + " AND a.slabType = '" + objTaxRebate.SlabType + "'";
            }
            sql = sql + " ORDER BY a.slab,a.slabType";
            dtTaxRebate = DataProcess.GetData(connectionString, sql);
            return dtTaxRebate;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public void Delete(string connectionString, TaxRebate objTaxRebate)
    {
        try
        {
            string sql = null;
            sql = @"DELETE FROM TaxRebate WHERE referenceNumber = '" + objTaxRebate.ReferenceNumber + "'";
            DataProcess.DeleteQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
    public int CheckTaxRebateRecord(string connectionString, TaxRebate objTaxRebate)
    {
        try
        {
            string sql = null;
            sql = "SELECT COUNT( referenceNumber) FROM TaxRebate WHERE financialYear = '" + objTaxRebate.FinancialYear + "' AND slabType = '" + objTaxRebate.SlabType + "'"
                + " AND slab = " + objTaxRebate.Slab + "";
            int countTaxRebate = Convert.ToInt32(DataProcess.GetSingleValueFromtable(connectionString, sql));
            return countTaxRebate;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
}