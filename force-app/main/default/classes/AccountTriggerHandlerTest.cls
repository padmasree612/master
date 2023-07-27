@isTest
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
    
    

}