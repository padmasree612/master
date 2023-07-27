@isTest
public class StudentQueueableExampleTest
{
    @isTest
    public static void StudentQueueableMethod()
    {
        Test.startTest();
            List<Admin_Pravalika_Student__c> stdList = new List<Admin_Pravalika_Student__c>();
                Admin_Pravalika_Student__c std = new Admin_Pravalika_Student__c();
                std.Name ='testname';
                std.Student_Term_Fee1__c= 1000;
                stdList.add(std);
                insert stdList;
                
                Id jobId = System.enqueueJob(new StudentQueueableExample(stdList));
        Test.stopTest();
        
    }
}