trigger emaildate on Contact (after insert,after update) {

    Set<Id> accntIds = new Set<Id>();
    
    for(Contact c: Trigger.new)
    {
        accntIds.add(c.AccountId);
    }
    
    Map<Id,Account> accountMap = new Map<Id,Account>([Select Id,Name,Email__c from Account where Id=:accntIds]);
    System.debug('@@@@@@ accountMap  Values @@@@@ '+accountMap);    
    List<Account> accountList = new List<Account>();
    
    for(Contact c : Trigger.new)
    {
    
        System.debug('$$$$$$$$$$$$$$$$$ Get Account Values $$$$$$$$$$$$ '+accountMap.get(c.AccountId));
        Account a = accountMap.get(c.AccountId);
        
        if(a!=null)
        {
            a.Email__c = c.Email;
            accountList.add(a);
        }
    }
    
    update accountList;
    
}