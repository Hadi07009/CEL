using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxOtherRoles
/// </summary>
public class TaxOtherRoles : TaxSlabUpdate
{
	public TaxOtherRoles()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private float _investmentLimitPercentage;

    public float InvestmentLimitPercentage
    {
        get { return _investmentLimitPercentage; }
        set { _investmentLimitPercentage = value; }
    }
}