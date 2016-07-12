using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AttendenceReportController
/// </summary>
public class AttendenceReportController
{
    public AttendenceReportController()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetAttendenceRecord(string connectionString, AttendenceReport objAttendenceReport)
    {
        try
        {
            DataTable dtLeaveReport = new DataTable();
            string sql = @"SELECT A.[EmployeeId] as EmpID,B.EmpName,B.Designation,B.Dept
                      ,A.[WorkingDay] as WorkingDay
                      ,A.[LeaveDay] as LeaveDay            
                      ,A.[PresentDay] as [Total Working Days]" + @"
                      ,[dbo].[TotalWorkingHour] (A.[EmployeeId],'" + objAttendenceReport.FromDate + "','" + objAttendenceReport.ToDate + "') AS [Total Working Hours] " +
                      @",[dbo].[NetWorkingHour] (A.[EmployeeId],'" + objAttendenceReport.FromDate + "','" + objAttendenceReport.ToDate + "') as [Net Working Hours] " +
                      ",([dbo].GetHourOfMinutes ([dbo].[NetWorkingMinute] (A.[EmployeeId],'" + objAttendenceReport.FromDate + "','" + objAttendenceReport.ToDate + "') - [dbo].[TotalWorkingMinute] (A.[EmployeeId],'" + objAttendenceReport.FromDate + "','" + objAttendenceReport.ToDate + "') )) AS [Extra/ Shortage Working Hours] " +
                      " , [dbo].[LateCountByEmpId](CONVERT(DATETIME, '" + objAttendenceReport.FromDate + "',103), CONVERT(DATETIME,'" + objAttendenceReport.ToDate + "',103),A.[EmployeeId]) AS [No. of Late Attendance] " +
                      @" FROM [tbl_Attendance_Report] A
                      INNER JOIN Emp_Details B ON A.EmployeeId = B.EmpID" +
                        " WHERE A.[UserId] = '" + objAttendenceReport.EntryUserCode + "' ";


            if (objAttendenceReport.OfficeLocation != null)
            {
                sql = sql + " AND B.OfficeID IN" + objAttendenceReport.OfficeLocation + "";
            }

            if (objAttendenceReport.Department != null)
            {
                sql = sql + " AND B.DeptID = '" + objAttendenceReport.Department + "'";

            }

            if (objAttendenceReport.EmployeeCategory != null)
            {
                sql = sql + " AND B.emptype = '" + objAttendenceReport.EmployeeCategory + "'";

            }

            if (objAttendenceReport.EmployeeCode != null)
            {
                sql = sql + " AND B.EmpID = '" + objAttendenceReport.EmployeeCode + "'";

            }

            sql = sql + " ORDER BY A.[EmployeeId]";
            dtLeaveReport = StoredProcedureExecutor.StoredProcedureExecuteReader(connectionString, sql);
            return dtLeaveReport;

        }
        catch (Exception msgException)
        {

            throw msgException;
        }

    }
}