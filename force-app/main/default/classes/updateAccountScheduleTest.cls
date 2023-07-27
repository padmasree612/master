@isTest
public class updateAccountScheduleTest
{
  
    @isTest static void AccountTriggerHandlerMethod()
    {
        Test.startTest();
        
        Account acc = new Account();
        acc.name = 'Test Name';
        acc.Email__c = 'test@yopmail.com';
        acc.Account_Department__c = 'testdept';
        acc.Type ='Prospect';
        insert acc;
        
        
        Contact con = new Contact();
        con.lastname ='testname';
        con.AccountId = acc.id; 
        insert con;
        
        updateAccount upa = new updateAccount();
        Database.executeBatch(upa);
        
        updateAccountSchedule  testobj = new updateAccountSchedule();
        String cronexpression =  '0 30 * * * ?';
        System.schedule('Testing', cronexpression, testobj);
        
        Test.stopTest();
        
        
        
    }
}