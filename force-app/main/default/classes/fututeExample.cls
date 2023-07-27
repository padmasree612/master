global class fututeExample
{
    @future
    public static void fututeExampleMethod(Set<Id> accountids)
    {
        List<Account> accountList = [Select id,No_of_contacts__c, (select id from contacts) from Account where id=:accountids];
        List<Account> accountLisUpdate = new List<Account>();
        for(Account accnt : accountList)
        {           
            accnt.No_of_contacts__c =accnt.contacts.size();
            accountLisUpdate.add(accnt);
        }
        update accountLisUpdate;
    }
}