using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IncomeTaxAssessmentController
/// </summary>
public class IncomeTaxAssessmentController
{
    public IncomeTaxAssessmentController()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetRecord(string connectionString, IncomeTaxAssessment objIncomeTaxAssessment)
    {
        try
        {
            string fromDate = "CONVERT(DATETIME,'" + objIncomeTaxAssessment.FromDate + "',103)";
            string toDate = "CONVERT(DATETIME,'" + objIncomeTaxAssessment.ToDate + "',103)";
            string sql = null;

            sql = @"SELECT B.EmpName,A.Empcode,B.Designation,Dept as Department,   
                 sum(case when Calcode = 'STDBAS' then CalVal else 0 end) AS [Basic],
                 sum(case when Calcode = 'STDOT' then CalVal else 0 end) AS [Over Time],
                 sum(case when Calcode = 'STDLFA' then CalVal else 0 end) AS [Leave Fare Assistance],
                 sum(case when Calcode = 'STDIB' then CalVal else 0 end) AS [Incentive Bonus],
                 sum(case when Calcode IN('BNS1','BNS2','BNS3') then CalVal else 0 end) AS [Festival Bonus],
                 sum(case when Calcode = 'PFEMP' then CalVal else 0 end) AS [Contribution  to recognized provident fund],
                 sum(case when Calcode in ('STDBAS','STDOT','STDLFA','STDIB','BNS1','BNS2','BNS3','PFEMP') then CalVal else 0 end) AS [TotalPart1],
                 sum(case when Calcode = 'STDHR' then CalVal else 0 end) AS [House Rent Allowance],   
                 sum(case when Calcode = 'STDCON' then CalVal else 0 end) AS [Conveyance Allowance],   
                 sum(case when Calcode = 'STDMA' then CalVal else 0 end) AS [Medical Allowance],   
                 sum(case when Calcode = 'STDFA' then CalVal else 0 end) AS [Food Allowance],   
                 sum(case when Calcode = 'STDOTH' then CalVal else 0 end) AS [Other Allowance],   
                 sum(case when Calcode in('STDOTH','STDCON','STDMA','STDFA','STDOTH') then CalVal else 0 end) AS [TotalPart2],                  
                 '' as [Admissible limit],'' as [Inadmissible amount]   
                 FROM hrms_salary A
                 INNER JOIN Emp_Details B ON A.Empcode = B.EmpID where Salmonth BETWEEN " + fromDate + " AND " + toDate + "";            

            if (objIncomeTaxAssessment.EmployeeCode != null)
            {
                sql = sql + " and EMPCODE = '" + objIncomeTaxAssessment.EmployeeCode + "'";
            }

            sql = sql + " group by B.EmpName,A.Empcode,B.Designation,Dept order by A.Empcode";

            var dtTaxAssessment = DataProcess.GetData(connectionString, sql);
            return dtTaxAssessment;

        }
        catch (Exception msgException)
        {
            
            throw msgException;
        }
    }
}