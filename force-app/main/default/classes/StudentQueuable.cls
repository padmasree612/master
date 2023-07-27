public class StudentQueuable implements Queueable
{
    List<Demo_Student__c> studentList;
    public StudentQueuable(List<Demo_Student__c> studs)
    {
        this.studentList = studs;
    }   
    public void execute(QueueableContext context)
    {
        for(Demo_Student__c std :studentList)
        {
           std.name = std.name +'UpdatedfromQueuable'; 
        }
        update studentList;
    }
}