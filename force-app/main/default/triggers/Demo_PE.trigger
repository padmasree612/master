trigger Demo_PE on Demo_PlatformEvent__e (after insert) {
    List<Id> accountIds = new List<Id>();
    List<Case> casestoUpdate = new List<Case>();
    for(Demo_PlatformEvent__e  pe : Trigger.New)
    {
        accountIds.add(pe.Account_Id__c);
    }
    List<Account> accountList = [Select Id,CustomerPriority__c,(Select Id,Priority from Cases) from Account where Id =:accountIds];
    for(Account acc : accountList)
    {
        for(Case c: acc.Cases)
        {
            c.Priority = acc.CustomerPriority__c;
            casestoUpdate.add(c);
        }
    }
    update casestoUpdate;

}