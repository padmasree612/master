@isTest
<<<<<<< HEAD
private class AccountTriggerHandlerTest
{
    static testMethod void TestAccountInsert()
    {
        List<Account> accountList = new List<Account>();
        Account acc = new Account();
        acc.name ='Test Class Demo';
        accountList.add(acc);
        insert accountList;
        System.debug('Display Account Id' +acc.id +'Account Name' +acc.name);   
        List<Contact> conList =[select id,lastname from Contact where AccountId=:acc.id];
        System.debug('Display ContactList' +conList);  
        
       
        
        
    }
    
    

=======
public class AccountTriggerHandlerTest
{
  
    @isTest static void AccountTriggerHandlerMethod()
    {
    
        List<Account> accList = new  List<Account>();
        Account acc = new Account();
        acc.name = 'Test Name';
        //acc.Email__c = 'test@yopmail.com';
        acc.Account_Department__c = 'testdept';
        acc.Type ='Prospect';
        accList.add(acc);
        insert accList;
        
        System.AssertNotEquals(accList.size(),1,'Acount Created');
        
        Contact con = new Contact();
        con.lastname ='testname';
        con.AccountId = acc.id; 
        insert con;
        
    }
    
    static testMethod void AccountTriggerHandlerMethod1()
    {
    
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
        
    }
>>>>>>> 33cfbdb (initial commit)
}