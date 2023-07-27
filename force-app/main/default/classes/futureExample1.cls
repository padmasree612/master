global class futureExample1
{
    @future
    public static void futureExampleMethod(Set<Id> accountIds)
    {
        List<Account> accounttoUpdate = new List<Account>();
        List<Account> accountList =[Select Id,name,No_of_Contacts__c,(Select id from contacts) from Account where id=:accountIds];
        for(Account acc :  accountList)
        {
            acc.Account_Branch__c= 'Branch';
            accounttoUpdate.add(acc);            
        } 
        
        update accounttoUpdate;
    
    }
}