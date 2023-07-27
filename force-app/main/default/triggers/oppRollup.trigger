trigger oppRollup on Opportunity (after insert, after update,after delete) {

    Set<Id> accntids = new Set<Id>();
    if(checkRecursive.firstRun)
    {
        checkRecursive.firstRun = false;
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Opportunity opp : Trigger.new)
        {
            accntids.add(opp.AccountId);
        }
    }
    if(Trigger.isDelete)
    {
        for(Opportunity opp : Trigger.old)
        {
            accntids.add(opp.AccountId);
        }
    }
    List<Account> accountList_Update = new List<Account>();
    
    for(AggregateResult ag : [Select Count(Id) cnt, SUM(Amount) totalamount, MAX(Amount)maxamnt, MIN(Amount)minamnt, AccountId from Opportunity
    where AccountId=:accntids GROUP BY AccountId])
    {
        Account acc = new Account(Id  = String.valueOf(ag.get('AccountId')));
        System.debug('@@@@@@ Count value @@@@@@ '+Integer.valueOf(ag.get('cnt')));
        acc.No_of_Opportunities__c = Integer.valueOf(ag.get('cnt'));
        System.debug('@@@@@@ Total Amount value @@@@@@ '+Integer.valueOf(ag.get('totalamount')));
        acc.Total_Opportunities__c = Integer.valueOf(ag.get('totalamount'));
        System.debug('@@@@@@ MAX Amount value @@@@@@ '+Integer.valueOf(ag.get('maxamnt')));
        acc.Max_Amount_Opp__c  = Integer.valueOf(ag.get('maxamnt'));
        System.debug('@@@@@@ Min Amount value @@@@@@ '+Integer.valueOf(ag.get('minamnt')));
        acc.Min_Amount_Opp__c = Integer.valueOf(ag.get('minamnt'));
        accountList_Update.add(acc);
    }
    
    update accountList_Update;
    
    }
}