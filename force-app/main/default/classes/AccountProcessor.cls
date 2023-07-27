public class AccountProcessor 
{
   
 @Future
  public static void countContacts(Set<id> setId) 
  {
 
      List<Account> lstAccount = [select id, (select id from contacts ) from account where id in :setId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
          
          acc.No_of_contacts__c = lstCont.size();

      }
     
      update lstAccount;
      List<Contact> conList =[select id,lastname from Contact where accountid =:setId];
      Id jobId = System.enqueueJob(new ContactPhoneQueueableExample(conList));
        
  }
  
}