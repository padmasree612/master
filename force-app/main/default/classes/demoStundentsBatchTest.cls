@isTest
public class demoStundentsBatchTest
{
    @isTest
    public static void demoStudentsMethod()
    {
        Admin_Pravalika_Student__c aps = new Admin_Pravalika_Student__c();
        aps.Name='TestName';
        aps.Student_Term_Fee1__c = 100;
        insert aps;
        
        Test.startTest();
            demoStundentsBatch dsb = new demoStundentsBatch();
            Database.executeBatch(dsb);
            
            scheduled_demoStundentBatch sh1 = new scheduled_demoStundentBatch();
            String sch = '0 0 2 * * ?'; 
            system.schedule('Demo_Schedule', sch, sh1); 
        Test.stopTest();
    }
}