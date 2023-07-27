global class futureExample
{
    @future
    public static void futureExampleMethod(Set<Id> accountIds)
    {
        List<Account> accounttoUpdate = new List<Account>();
        List<Account> accountList =[Select Id,name,No_of_Contacts__c,(Select id from contacts) from Account where id=:accountIds];
        for(Account acc :  accountList)
        {
            acc.No_of_Contacts__c = acc.Contacts.size();
            accounttoUpdate.add(acc);            
        } 
        
        update accounttoUpdate;
        //futureExample1.futureExampleMethod(accountIds);
    
    }
}