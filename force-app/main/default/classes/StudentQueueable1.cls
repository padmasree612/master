public class StudentQueueable1 implements Queueable
{
    List<Admin_Student__c> studentList;
    
    public StudentQueueable1(List<Admin_Student__c> studs)
    {
        this.studentList = studs; 
    }
    public void execute(QueueableContext qc)
    {
        for(Admin_Student__c std : studentList)
        {
            std.Student_Group__c= 'ECE';
            
        }
        
        update studentList;
    }
}