using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxRebate
/// </summary>
public class TaxRebate : TaxSlabUpdate
{
	public TaxRebate()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private decimal _amountUpto;

    public decimal AmountUpto
    {
        get { return _amountUpto; }
        set { _amountUpto = value; }
    }
}