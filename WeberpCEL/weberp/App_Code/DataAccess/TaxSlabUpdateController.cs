using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxSlabUpdateController
/// </summary>
public class TaxSlabUpdateController
{
    public TaxSlabUpdateController()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Save(string _connectionString, TaxSlabUpdate objTaxSlabUpdate)
    {
        try
        {
            if (CheckSlab(_connectionString, objTaxSlabUpdate) > 0)
            {
                throw new Exception("Tax slab exist. ");

            }
            string sql = null;
            sql = @"declare @sl int,@refnumber varchar(10)
	            set @sl=(select isnull(max(RIGHT(referenceNumber,5)),0)+1 as sl from TaxSlab) 
	            set @refnumber=STUFF('00000',6-LEN(@sl),20,@sl)
                INSERT INTO TaxSlab 
		        (
		        referenceNumber,
		        financialYear,
		        fromDate,
		        toDate,
		        slabType,
		        slab,
		        slabAmount,
		        taxRate
		        ) 
		        VALUES 
		        (
		        @refnumber,
		        '" + objTaxSlabUpdate.FinancialYear + "',CONVERT(DATETIME, '" + objTaxSlabUpdate.FromDate + "',103),CONVERT(DATETIME, '" + objTaxSlabUpdate.ToDate + "',103),'" + objTaxSlabUpdate.SlabType + "'," + objTaxSlabUpdate.Slab + "," + objTaxSlabUpdate.SlabAmount + "," + objTaxSlabUpdate.TaxRate + ")";
            DataProcess.InsertQuery(_connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }

    public void Update(string _connectionString, TaxSlabUpdate objTaxSlabUpdate)
    {
        try
        {
            string sql = null;
            sql = @"UPDATE TaxSlab
		    SET
            financialYear	=	ISNULL('" + objTaxSlabUpdate.FinancialYear + "',financialYear),	fromDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxSlabUpdate.FromDate + "',103),fromDate)," +
            " toDate	=	ISNULL(CONVERT(DATETIME,'" + objTaxSlabUpdate.ToDate + "',103),toDate),slabType	=	ISNULL('" + objTaxSlabUpdate.SlabType + "',slabType),slab	=	ISNULL(" + objTaxSlabUpdate.Slab + ",slab), " +
            " slabAmount	=	ISNULL(" + objTaxSlabUpdate.SlabAmount + ",slabAmount),	taxRate	=	ISNULL(" + objTaxSlabUpdate.TaxRate + ",taxRate) WHERE	referenceNumber= '" + objTaxSlabUpdate.ReferenceNumber + "'";
            DataProcess.UpdateQuery(_connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public DataTable GetTaxSlab(string connectionString, TaxSlabUpdate objTaxSlabUpdate)
    {
        try
        {
            string sql = null;
            DataTable dtTaxSlab = new DataTable();
            sql = @"SELECT a.referenceNumber,
		    a.financialYear,
		    a.fromDate,
		    a.toDate,
		    a.slabType,
		    b.genderText,
		    a.slab,
		    a.slabAmount,
		    a.taxRate FROM TaxSlab a 
		    LEFT JOIN HRMS_Emp_Gender b ON a.slabType = b.genderCode WHERE a.financialYear = '" + objTaxSlabUpdate.FinancialYear + "'";
            if (objTaxSlabUpdate.SlabType != null)
            {
                sql = sql + " AND a.slabType = '" + objTaxSlabUpdate.SlabType + "'";
            }
            sql = sql + " ORDER BY a.slab,a.slabType";
            dtTaxSlab = DataProcess.GetData(connectionString, sql);
            return dtTaxSlab;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
    public void Delete(string connectionString, TaxSlabUpdate objTaxSlabUpdate)
    {
        try
        {
            string sql = null;
            sql = @"DELETE FROM TaxSlab WHERE referenceNumber = '" + objTaxSlabUpdate.ReferenceNumber + "'";
            DataProcess.DeleteQuery(connectionString, sql);

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
    public int CheckSlab(string connectionString, TaxSlabUpdate objTaxSlabUpdate)
    {
        try
        {
            string sql = null;
            sql = "SELECT COUNT( referenceNumber) FROM TaxSlab WHERE financialYear = '" + objTaxSlabUpdate.FinancialYear + "' AND slabType = '" + objTaxSlabUpdate.SlabType + "'"
                + " AND slab = " + objTaxSlabUpdate.Slab + "";
            int countSlab = Convert.ToInt32(DataProcess.GetSingleValueFromtable(connectionString, sql));
            return countSlab;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
}