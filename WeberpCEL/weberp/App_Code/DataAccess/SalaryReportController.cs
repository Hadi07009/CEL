using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalaryReportController
/// </summary>
public class SalaryReportController
{
    public SalaryReportController()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetSalaryRecord(string connectionString, SalaryReport objSalaryReport)
    {
        try
        {
            DataTable dtLeaveReport = new DataTable();
            string sql = @"SELECT For_Det_Empid,B.EmpName,B.Designation,B.Dept 
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDBAS' THEN For_Det_Value ELSE 0 END)) AS [Basic]
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDHR' THEN For_Det_Value ELSE 0 END)) AS HR
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDCON' THEN For_Det_Value ELSE 0 END)) AS CA
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDMA' THEN For_Det_Value ELSE 0 END)) AS MA
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDLFA' THEN For_Det_Value ELSE 0 END)) AS LFA
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDOTH' THEN For_Det_Value ELSE 0 END)) AS Others
                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'PFEC' THEN For_Det_Value ELSE 0 END)) AS PF

                    ,SUM( (CASE WHEN FOR_DET_FORCODE = 'STDBAS' THEN For_Det_Value ELSE 0 END))
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'STDHR' THEN For_Det_Value ELSE 0 END)) 
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'STDCON' THEN For_Det_Value ELSE 0 END)) 
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'STDMA' THEN For_Det_Value ELSE 0 END)) 
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'STDLFA' THEN For_Det_Value ELSE 0 END)) 
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'STDOTH' THEN For_Det_Value ELSE 0 END)) 
                    +SUM( (CASE WHEN FOR_DET_FORCODE = 'PFEC' THEN For_Det_Value ELSE 0 END)) AS GrossSalary
                    FROM hrms_emp_for_det A
                    INNER JOIN Emp_Details B ON A.For_Det_Empid = B.EmpID
                    INNER JOIN HrMs_Emp_mas C ON A.For_Det_Empid = C.Emp_Mas_Emp_Id
                    WHERE formulaStatus = 1 ";
            if (objSalaryReport.OfficeLocation != null)
            {
                sql = sql + " AND B.OfficeID IN" + objSalaryReport.OfficeLocation + "";
            }

            if (objSalaryReport.Department != null)
            {
                sql = sql + " AND B.DeptID = '" + objSalaryReport.Department + "'";

            }

            if (objSalaryReport.EmployeeCategory != null)
            {
                sql = sql + " AND B.emptype = '" + objSalaryReport.EmployeeCategory + "'";

            }

            if (objSalaryReport.EmployeeCode != null)
            {
                sql = sql + " AND B.EmpID = '" + objSalaryReport.EmployeeCode + "'";

            }

            if (objSalaryReport.EmployeeStatus == "Y" || objSalaryReport.EmployeeStatus == "N")
            {
                sql = sql + " AND C.Emp_Mas_Term_Flg = '" + objSalaryReport.EmployeeStatus + "'";
                
            }

            sql = sql + " GROUP BY For_Det_Empid,B.EmpName,B.Designation,B.Dept ORDER BY For_Det_Empid";
            dtLeaveReport = StoredProcedureExecutor.StoredProcedureExecuteReader(connectionString, sql);
            return dtLeaveReport;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }
    }
}