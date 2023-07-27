trigger platfomEvent_Demo on Demo_PE__e (after insert) {
    List<Id> accountIds = new List<Id>();
    List<Case> casestoUpdate = new List<Case>();
    for(Demo_PE__e pe : Trigger.new)
    {
        accountIds.add(pe.Account_Id__c);
    }
    List<Account> accontList =[Select Id,CustomerPriority__c,(Select id,priority from cases) from Account where Id=:accountIds];
    for(Account acc : accontList)
    {
        for(Case c : acc.Cases)
        {
            c.Priority = acc.CustomerPriority__c;
            casestoUpdate.add(c);
        }
    }
    update casestoUpdate;

}