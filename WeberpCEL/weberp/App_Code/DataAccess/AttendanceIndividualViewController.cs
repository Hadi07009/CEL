using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AttendanceIndividualViewController
/// </summary>
public class AttendanceIndividualViewController
{
	public AttendanceIndividualViewController()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void Save(string connectionString,AttendanceIndividualView objAttendanceIndividualView)
    {
        var storedProcedureComandTest = "exec [AttendanceReportInitiate_tblAttendanceReport] '" +
                                        objAttendanceIndividualView.TargetDate + "','" +
                                        objAttendanceIndividualView.DayName + "','" +
                                        objAttendanceIndividualView.Description + "','" +
                                        objAttendanceIndividualView.InTime + "','" +
                                        objAttendanceIndividualView.OutTime + "','" +
                                        objAttendanceIndividualView.LateBy + "','" +
                                        objAttendanceIndividualView.EarlyBy + "','" +
                                        objAttendanceIndividualView.Remarks + "','" +
                                        objAttendanceIndividualView.UserId + "'";
        StoredProcedureExecutor.StoredProcedureExecuteNonQuery(connectionString, storedProcedureComandTest);
    }
    public void Delete(string connectionString, AttendanceIndividualView objAttendanceIndividualView)
    {
        var storedProcedureComandTest = "exec [AttendanceReportDelete_tblAttendanceReport] '" +
            objAttendanceIndividualView.UserId + "'";
        StoredProcedureExecutor.StoredProcedureExecuteNonQuery(connectionString, storedProcedureComandTest);
    }
}