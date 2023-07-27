trigger platform_event on platform_events__e (after insert) {
    List<Id> accountIds = new List<Id>();
    List<Case> casestoUpdate = new List<Case>();
    for(platform_events__e  pe : Trigger.New)
    {
        accountIds.add(pe.Account_Id__c);
    }
    List<Account> accList = [Select Id,CustomerPriority__c,(Select Id,Priority from Cases) from Account where Id=:accountIds];
    for(Account acc : accList)
    {
        for(Case c : acc.cases)
        {
            c.Priority  = acc.CustomerPriority__c;
            casestoUpdate.add(c);
        }
    }
    update casestoUpdate;

}