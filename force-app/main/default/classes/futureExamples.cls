public class futureExamples
{
    @future
    public static void countContacts(Set<Id> accountIds)
    {
        List<Account> updateAccounts = new List<Account>();
        List<Account> accountList = [Select Id,Name,No_of_contacts__c,(select id from Contacts) from Account where Id=:accountIds];
        for(Account acc :accountList)
        {
            acc.No_of_contacts__c = acc.Contacts.size();
            updateAccounts.add(acc);
            
        }
        update updateAccounts;
        
        /*String jsonString;
        futureMethodExample.countContats(jsonString);*/
        
       /*List<Admin_Pravalika_Student__c> stdList =[Select Id,Name from Admin_Pravalika_Student__c];
       Id jobId = System.enqueueJob(new StudentQueueableExample(stdList));*/
    }
}