@isTest
public class StudentQueueableTest
{
  
    @isTest static void AccountTriggerHandlerMethod()
    {
        Test.startTest();
        
        List<Admin_Student__c> studList = new List<Admin_Student__c>();
        
        Admin_Student__c  std = new Admin_Student__c ();
        std.name = 'testname';
        std.Student_Roll_Number__c =1234;
        studList.add(std);
        insert studList;       
        
         
        Id JobId = System.enqueueJob(new StudentQueueable(studList));
        
        Test.stopTest();
        
    }
}