@isTest
private class DisplayAccountsOnMapctrlAccountsTest {

	private static testMethod void testConstructor() {
		ApexPages.StandardController stdCtrl =
			new ApexPages.StandardController(new Account());

		DisplayAccountsOnMapctrlAccounts ctrl = new DisplayAccountsOnMapctrlAccounts(stdCtrl);

		System.assertNotEquals(null, ctrl);
	}

}