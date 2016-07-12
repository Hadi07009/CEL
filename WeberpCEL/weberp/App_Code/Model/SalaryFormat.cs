using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SalaryFormat
/// </summary>
public class SalaryFormat
{
    public SalaryFormat()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private DateTime _targetDate;

    public DateTime TargetDate
    {
        get { return _targetDate; }
        set
        {
            if (value == null)
            {
                throw new Exception("Must enter" + " date ");
            }
            _targetDate = value;
        }
    }
}