public class AditsFirstController {
    
    public string result{get;set;}
    public map<string,QuestionAnswer> queAndAnswers{get;set;}
    public map<string,string> answers {get;set;}
    public list<QuestionAnswer> questions {get;set;}
    
    public class QuestionAnswer{
        public string Question{get;set;}
        public string Answer{get;set;}
        public string qId{get;set;}
        
        public QuestionAnswer(string qid,string Question,string Answer){
        	this.qId = qid;
            this.Question = Question;
            this.Answer = Answer;
        }
    }
    
    public AditsFirstController(){
        queAndAnswers =  new map<string,QuestionAnswer>();
        questions = new list<QuestionAnswer>(); 
        answers = new map<string,string>();
        
        
        queAndAnswers.put('Q1',new QuestionAnswer('Q1','Is New Delhi the capital city of India?',''));
        queAndAnswers.put('Q2',new QuestionAnswer('Q2','Is London the capital city of England?',''));
        queAndAnswers.put('Q3',new QuestionAnswer('Q3','Is Cairo the capital city of Egypt?',''));
        queAndAnswers.put('Q4',new QuestionAnswer('Q4','Is Paris the capital city of Germany?',''));
        queAndAnswers.put('Q5',new QuestionAnswer('Q5','Is Berlin the capital city of Austria?',''));
        queAndAnswers.put('Q6',new QuestionAnswer('Q6','Is Bern the capital city of Switzerland?',''));
        queAndAnswers.put('Q7',new QuestionAnswer('Q7','Is Karachi the capital city of Pakistan?',''));
        queAndAnswers.put('Q8',new QuestionAnswer('Q8','Is Lisbon the capital city of Portugal?',''));
        queAndAnswers.put('Q9',new QuestionAnswer('Q9','Is Barcelona the capital city of Spain?',''));
        
        Answers.put('Q1','Y');
        Answers.put('Q2','Y');
        Answers.put('Q3','Y');
        Answers.put('Q4','N');
        Answers.put('Q5','N');
        Answers.put('Q6','Y');
        Answers.put('Q7','N');
        Answers.put('Q8','Y');
        Answers.put('Q9','N');
        
        
        for(QuestionAnswer q : queAndAnswers.values()){
            questions.add(q);
        }
       
    }
    
    public List<SelectOption> getAnswerOptions(){
        List<SelectOption> answerOptions = new List<SelectOption> ();
        answerOptions.add(new SelectOption('Y','Yes'));
        answerOptions.add(new SelectOption('N','No'));
        return answerOptions;
    }
    
    public void submitAnswers(){
        integer iCount=0;
        for(QuestionAnswer q : questions){
            if(Answers.get(q.qid)==q.Answer)
                iCount++;
            else
                iCount--;
        }
        
        if(iCount>5)
            result='Pass!';
        else
            result='Failed!!!';
    }
}