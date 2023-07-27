@isTest
public class contactTriggerHandlerTest
{
  //@isTest
  public  static testMethod void contactTriggerHandlerMehod()
    {
    
        List<Account> accontList = new List<Account>();
        Account acc = new Account();
        acc.name ='Test Account';
        accontList.add(acc);
        insert accontList;        
       
        
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        con.FirstName ='Test FirstName';
        con.AccountId =accontList[0].Id;
        con.LastName = 'Test LastName';
        con.Email ='test@yopmail.com';
        con.Amount__c =1234;
        conList.add(con);
        insert conList;
        RecursiveTriggerHandler.isFirstTime =true;
        
    }
}