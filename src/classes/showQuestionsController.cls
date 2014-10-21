public class showQuestionsController{
    public Review__c review {get;set;}
    
    string Name {get{
        return review.Name;}
        
    set;}
    public showQuestionsController(ApexPages.StandardController controller){
        review = (Review__c) controller.getRecord();    
        
    }
    
    public showQuestionsController(){
        review = [select id, name, Contact__r.name,Question_Count__c,Review_Rating__c,Total_Rating__c  from review__c where id='a00b0000007sg7h'];   
        
    }
    public PageReference listQuestions(){
        return new PageReference('/a00/o');
    }
}