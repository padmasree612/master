public class StudentQueueableExample implements Queueable {
    List<Admin_Pravalika_Student__c> stdList;
    public StudentQueueableExample(List<Admin_Pravalika_Student__c> stdList)
    {
        this.stdList = stdList;
    }
    
    public void execute(QueueableContext qc)
    {
        for(Admin_Pravalika_Student__c std : stdList)
        {
            std.Student_Address__c ='Updated from Queuable';
          
        }
        
        update stdList;
        
      
    }
}