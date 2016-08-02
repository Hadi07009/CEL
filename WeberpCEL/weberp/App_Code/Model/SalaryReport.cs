using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalaryReport
/// </summary>
public class SalaryReport
{
	public SalaryReport()
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
    private string _employeeStatus;

    public string EmployeeStatus
    {
        get { return _employeeStatus; }
        set { _employeeStatus = value; }
    }
}