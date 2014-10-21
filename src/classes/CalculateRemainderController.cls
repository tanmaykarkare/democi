public class CalculateRemainderController {
    public long number1{get;set;}
    public long number2{get;set;}
    public double quotient{get;set;}
    public double remainder{get;set;}
    
    public void goCalculate(){
       quotient = math.abs(number1/number2); 
       remainder = math.mod(number1,number2);
    }
}