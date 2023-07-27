@isTest
public class futureExampleTest
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
        
        Set<Id> accountIds = new Set<Id>();
        accountIds.add(acc.id);
        
       futureExample.futureExampleMethod(accountIds);
        
        Test.stopTest();
        
        
        
    }
}