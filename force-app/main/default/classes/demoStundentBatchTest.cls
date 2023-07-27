@isTest
public class demoStundentBatchTest
{
    @isTest
    public static void demoStundentBatchMethod()
    {
        Test.startTest();       
   
            Admin_Student__c stud = new Admin_Student__c();
            stud.Name ='Teststud';
            stud.Student_Term_Fee__c=1000;
            insert stud ;
            
            demoStundentBatch ds = new demoStundentBatch();
            Database.executeBatch(ds);
            
            scheduled_demoStundentBatch sdh = new scheduled_demoStundentBatch ();
            String cron ='0 0 2 * * ?';
            System.schedule('Demo_schedule',cron,sdh);
         
        Test.stopTest();
    }
}