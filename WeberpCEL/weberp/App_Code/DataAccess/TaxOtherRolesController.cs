using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxOtherRolesController
/// </summary>
public class TaxOtherRolesController
{
	public TaxOtherRolesController()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void Save(string connectionString, TaxOtherRoles objTaxOtherRoles)
    {
        try
        {
            if (CheckSlab(connectionString, objTaxOtherRoles) > 0)
            {
                throw new Exception("Tax roles exist. ");

            }
            string sql = null;
            sql = @"declare @sl int,@refnumber varchar(10)
	            set @sl=(select isnull(max(RIGHT(referenceNumber,5)),0)+1 as sl from TaxSingaleAmountSetup) 
	            set @refnumber=STUFF('00000',6-LEN(@sl),20,@sl)
                INSERT INTO TaxSingaleAmountSetup 
		        (
		        referenceNumber,
		        financialYear,
		        fromDate,
		        toDate,
		        slabType,
		        slab,
		        MinTaxAmount,
		        InvestMentLimitPercentage,
                TaxDeductionPercentage
		        ) 
		        VALUES 
		        (
		        @refnumber,
		        '" + objTaxOtherRoles.FinancialYear + "',CONVERT(DATETIME, '" + objTaxOtherRoles.FromDate + "',103),CONVERT(DATETIME, '" + objTaxOtherRoles.ToDate + "',103),'" + objTaxOtherRoles.SlabType + "'," + objTaxOtherRoles.Slab + "," + objTaxOtherRoles.SlabAmount + "," + objTaxOtherRoles.InvestmentLimitPercentage + "," + objTaxOtherRoles.TaxRate + ")";
            DataProcess.InsertQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public void Update(string connectionString, TaxOtherRoles objTaxOtherRoles)
    {
        try
        {
            string sql = null;
            sql = @"UPDATE TaxSingaleAmountSetup
		    SET
            financialYear	=	ISNULL('" + objTaxOtherRoles.FinancialYear + "',financialYear),	fromDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxOtherRoles.FromDate + "',103),fromDate)," +
            " toDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxOtherRoles.ToDate + "',103),toDate),slabType	=	ISNULL('" + objTaxOtherRoles.SlabType + "',slabType),slab	=	ISNULL(" + objTaxOtherRoles.Slab + ",slab), " +
            " MinTaxAmount	=	ISNULL(" + objTaxOtherRoles.SlabAmount + ",MinTaxAmount),	InvestMentLimitPercentage	=	ISNULL(" + objTaxOtherRoles.InvestmentLimitPercentage + ",InvestMentLimitPercentage), TaxDeductionPercentage	=	ISNULL(" + objTaxOtherRoles.TaxRate + ",TaxDeductionPercentage) WHERE	referenceNumber= '" + objTaxOtherRoles.ReferenceNumber + "'";
            DataProcess.UpdateQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public DataTable GetTaxRebateRecord(string connectionString, TaxOtherRoles objTaxOtherRoles)
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
		    a.MinTaxAmount,
		    a.InvestMentLimitPercentage,
            a.TaxDeductionPercentage FROM TaxSingaleAmountSetup a 
		    LEFT JOIN HRMS_Emp_Gender b ON a.slabType = b.genderCode WHERE a.financialYear = '" + objTaxOtherRoles.FinancialYear + "'";
            if (objTaxOtherRoles.SlabType != null)
            {
                sql = sql + " AND a.slabType = '" + objTaxOtherRoles.SlabType + "'";
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
    public void Delete(string connectionString, TaxOtherRoles objTaxOtherRoles)
    {
        try
        {
            string sql = null;
            sql = @"DELETE FROM TaxSingaleAmountSetup WHERE referenceNumber = '" + objTaxOtherRoles.ReferenceNumber + "'";
            DataProcess.DeleteQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
    public int CheckSlab(string connectionString, TaxOtherRoles objTaxOtherRoles)
    {
        try
        {
            string sql = null;
            sql = "SELECT COUNT( referenceNumber) FROM TaxSingaleAmountSetup WHERE financialYear = '" + objTaxOtherRoles.FinancialYear + "' AND slabType = '" + objTaxOtherRoles.SlabType + "'"
                + " AND slab = " + objTaxOtherRoles.Slab + "";
            int countSlab = Convert.ToInt32(DataProcess.GetSingleValueFromtable(connectionString, sql));
            return countSlab;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
}