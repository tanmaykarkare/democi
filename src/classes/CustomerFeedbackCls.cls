public class CustomerFeedbackCls {

    public Integer FeedbackScore4 { get; set; }
    public String Que4 { get; set; }
    public Integer FeedbackScore3 { get; set; }
    public String Que3 { get; set; }
    public Integer FeedbackScore2 { get; set; }
    public String Que2 { get; set; }
    public String Que1 { get; set; }
    public integer FeedbackScore1 {get;set;}
    public Contact Customer {get;set;}
    private Review__c newReview;
    public List<String> Que = new String[4];
    public List<integer> FeedbackScore = new Integer[4];
    
    public Account acc{get;set;}
    public Contact selectedContact {get;set;}


    public String accountName { get; set; }

    public String accountId { get; set; }
    

    
    public CustomerFeedbackCls(){
          
        Customer = new Contact();
        
         
        Que1 = '1. How do you rate our staff?';
        Que[0]=Que1;
        Que2 = '2. How do you rate our infrastructure?';
        Que[1]=Que2;
        Que3 = '3. How do you rate our service?';
        Que[2] = Que3;
        Que4 = '4. How do you rate our food?';
        Que[3]=Que4;
    }
    
    public PageReference SubmitFeedback() {
        try{
            selectedContact = [select id from Contact where FirstName=:Customer.FirstName and LastName=:Customer.LastName 
                    and Email=:Customer.Email and CheckIn_Date__c=:Customer.CheckIn_Date__c];
        }catch (System.QueryException e){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Couldn\'t locate Customer/Booking details, please ensure entered details are correct!');
            ApexPages.addMessage(myMsg);
            return null;
        }
        
        if (selectedContact!=null)
            createQuestions();
        
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Feedback has been submitted successfully!');
        ApexPages.addMessage(myMsg);            
        return null;
    }
    
    public void createQuestions(){
        List<Questions__c> queList = new List<Questions__c>();
        
        newReview = new Review__c();
        newReview.Contact__c=selectedContact.id;
        newReview.Account__c=accountId;
        insert newReview;
        
        FeedbackScore[0]=FeedbackScore1;
        FeedbackScore[1]=FeedbackScore2;
        FeedbackScore[2]=FeedbackScore3;
        FeedbackScore[3]=FeedbackScore4;

        for(integer iCount=0;iCount<4;iCount++){
            Questions__c queTemp = new Questions__c();
            queTemp.Survey_Question__c=Que[iCount];
            queTemp.Review__c=newReview.id;
            queTemp.Rating__c=FeedbackScore[iCount];
            queList.add(queTemp);
        }
        insert queList;
    }
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('0','Bad'));
        options.add(new SelectOption('5','Good'));
        options.add(new SelectOption('10','Excellent')); 
        return options;
    }
}