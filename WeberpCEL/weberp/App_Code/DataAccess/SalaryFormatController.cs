using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalaryFormatController
/// </summary>
public class SalaryFormatController
{
    public SalaryFormatController()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetRecord(string connectionString, SalaryFormat objSalaryFormat)
    {
        try
        {
            DataTable dtSalaryRecord = new DataTable();
            var storedProcedureComandTest = "exec [spSalaryFormat] '" + objSalaryFormat.TargetDate + "'";
            return dtSalaryRecord = StoredProcedureExecutor.StoredProcedureExecuteReader(connectionString, storedProcedureComandTest);
        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
}