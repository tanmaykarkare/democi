public class CategoryWrapper {
 
    public Boolean checked{ get; set; }
    public Account cat { get; set;}
 
    public CategoryWrapper(){
        cat = new Account();
        checked = false;
    }
 
    public CategoryWrapper(Account c){
        cat = c;
        checked = false;
    }
 
 
}