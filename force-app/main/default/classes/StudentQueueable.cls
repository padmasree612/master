public class StudentQueueable implements Queueable
{
    List<Admin_Student__c> studentList;
    
    public StudentQueueable(List<Admin_Student__c> studs)
    {
        this.studentList = studs; 
    }
    public void execute(QueueableContext qc)
    {
        for(Admin_Student__c std : studentList)
        {
            std.name = std.name +'Updated from Queueable';
            std.Student_Roll_Number__c =1234;
        }
        
        update studentList;
        
        
    }
}