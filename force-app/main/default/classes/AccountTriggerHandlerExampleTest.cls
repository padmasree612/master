@isTest
public class AccountTriggerHandlerExampleTest
{
    @isTest
    public static void triggerhandlerMethod()
    {
        Test.startTest();
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name ='TestMethodName';
        acc.BillingStreet='kphb';
        acc.BillingCity='Hyd';
        acc.BillingState='TN';
        acc.BillingPostalCode='12345';
        acc.BillingCountry='India';
        accList.add(acc);
        insert accList;
        
        Contact con = new Contact();
        con.FirstName='conTest';
        con.lastName ='TestCon';        
        con.Email='test@yopmail.com';
        con.Phone ='1234566';
        con.AccountId =accList[0].id;
        insert con;
       Test.stopTest();
        Contact conList =[Select Id,Name,AccountId from Contact where id=:con.Id];
        System.debug('Contact List '+conList);
        
        Opportunity opp = new Opportunity();
     opp.Name ='TestOpp';
     opp.Type ='New Customer';
     opp.Amount = 1000;
     opp.CloseDate = System.today();
     opp.StageName ='Prospecting';
     opp.AccountId = accList[0].Id;

     
     insert opp;
        
        
    }
}