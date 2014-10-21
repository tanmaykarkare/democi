public class SupportPreChat {
 
  public Contact theContact {get; set;}
  public Case theCase {get;set;}
    public String endpoint {get; set;}
    public String jsSubmitForm {get; set;}
    
    public SupportPreChat() {               
        jsSubmitForm = '';
        theContact = new Contact();
        theContact.Email = 'tt@gg.com';
        theContact.firstName = 'tt';
        theContact.lastName = 'tt'; 
 
        //get the querystring data passed in by the button.  This is the liveagent form action
        //EX: ?endpoint=https%3A%2F%2F1.la1a1.salesforceliveagent.com... etc..
        endpoint = '';
        PageReference pageRef = ApexPages.currentPage();
        if (pageRef.getParameters() != null) {
            if (pageRef.getParameters().containsKey('endpoint')) {
                if (pageRef.getParameters().get('endpoint') != null) {
                    endpoint = pageRef.getParameters().get('endpoint');
                }
            }           
        }       
    }
 
    public pagereference clickChat() {      
        PageReference pr = null;        
        
        
        Id AccountId = '001b0000009Fx6g'; //ID for an umbrella account to stick these contacts on
        Id OwnerId = '005b0000000aGTv'; //ID for a default user to set as the owner of the contact 
        System.debug('Inside clickChat()');
        
        //see if the email submitted exists as a contact
        List<Contact> contactList = new List<Contact>();
        if ( (theContact.email != null) && (theContact.email != '') ) {
            contactList = [SELECT Id,AccountId FROM Contact WHERE email=:theContact.email LIMIT 1];
            if (contactList.isEmpty()) {                
                //create the contact
                Contact c = new Contact(
                    FirstName = theContact.FirstName,
                    LastName = theContact.LastName,
                    Email = theContact.Email,
                    AccountId = AccountId,
                    OwnerId = OwnerId
                );
                insert c;
            }
            else{
               
                theCase = new Case(
                        contactid = contactList[0].id,
                        subject = 'Live Chat',
                        AccountId = contactList[0].AccountId
                        );
                insert theCase;
            }   
        }  
         
        
        
        
        jsSubmitForm = 'jQuery(\'#prechatForm\').submit();';
        
        return pr;      
    }
 
 

 
 
}