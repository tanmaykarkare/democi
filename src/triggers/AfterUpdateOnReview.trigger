trigger AfterUpdateOnReview on Review__c (after update) {
    Review__c myReview = new Review__c();
    List<Case> caseList = new List<Case>();
    List<Account> accList = new List<Account>();
    
    double avgRating=0;
    String AccountId;
    
    for(Review__c rv : Trigger.new){
        if(rv.Review_Rating__c<45 && rv.Question_Count__c==4){
            Case newCase = new Case(subject='Review below 45%', contactid=rv.Contact__c);
            caseList.add(newCase);
        } 
          
    }   

    List<aggregateResult> results = [select avg(total_Rating__c) AvgRating,Account__c from review__c group by Account__c ];
    for (AggregateResult ar : results){
        if(ar.get('AvgRating')!=null)
            avgRating=(double)ar.get('AvgRating');
        if(ar.get('Account__c')!=null)
            AccountId=(string)ar.get('Account__c');
        Account newAcc = new Account();
        newAcc.id = AccountId;
        newAcc.Overall_Rating__c=avgRating/4;
        accList.add(newAcc); 
    }
    if(caseList.size()>0)
        insert caseList;
        
    if(accList.size()>0)
        update accList;
  
}