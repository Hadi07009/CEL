using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AttendenceReport
/// </summary>
public class AttendenceReport
{
	public AttendenceReport()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _officeLocation;

    public string OfficeLocation
    {
        get { return _officeLocation; }
        set { _officeLocation = value; }
    }
    private string _department;

    public string Department
    {
        get { return _department; }
        set { _department = value; }
    }
    private string _employeeCategory;

    public string EmployeeCategory
    {
        get { return _employeeCategory; }
        set { _employeeCategory = value; }
    }
    private string _employeeCode;

    public string EmployeeCode
    {
        get { return _employeeCode; }
        set { _employeeCode = value; }
    }
    private string _entryUserCode;

    public string EntryUserCode
    {
        get { return _entryUserCode; }
        set { _entryUserCode = value; }
    }
    private DateTime _fromDate;

    public DateTime FromDate
    {
        get { return _fromDate; }
        set { _fromDate = value; }
    }
    private DateTime _toDate;

    public DateTime ToDate
    {
        get { return _toDate; }
        set { _toDate = value; }
    }
}