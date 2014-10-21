public class HotelLookupCls {
   
    
    public Account[] getAccounts() {
        return [select Id, Name, BillingStreet, BillingCity,BillingPostalCode  from Account];
    }


}