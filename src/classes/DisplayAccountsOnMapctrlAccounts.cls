public with sharing class DisplayAccountsOnMapctrlAccounts {

	public Account acc {get; set;}

	public DisplayAccountsOnMapctrlAccounts(ApexPages.StandardController ctrl) {
		acc = (Account) ctrl.getRecord();
	}

}