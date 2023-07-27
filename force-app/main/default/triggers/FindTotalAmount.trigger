trigger FindTotalAmount on Opportunity (after insert, after update, after delete) {
    Set<Id> accountIds = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Opportunity opp : Trigger.new)
        {
            accountIds.add(opp.AccountId);
            System.debug('Display Accountid inser or update' +accountIds);
        }
    }
    if(Trigger.isDelete)        
    {
            for(Opportunity opp : Trigger.old)
            {
                accountIds.add(opp.AccountId);
                System.debug('Display Accountid Delete' +accountIds);
            }
        
    }
    List<Account> accountList = [select id,Total_Amount__c,(Select id, Amount from Opportunities) from Account where Id=:accountIds];
    System.debug('List of Accountids' +accountList);
    List<Account> accUpdate = new List<Account>();
    for(Account acc :accountList)
    {
        Double totalAmount =0.0;
        for(Opportunity op :acc.Opportunities)
        {
            System.debug('Before Total Amount Update' +totalAmount);
            totalAmount+=op.Amount; 
            System.debug('After Total Amount Update' +totalAmount);
        }
        acc.Total_Amount__c = totalAmount;
        System.debug('Before Total Amount on Account' +acc.Total_Amount__c);
        accUpdate.add(acc);
        System.debug('After Total Amount on Account' +acc.Total_Amount__c);
    }
    update accUpdate;
    

}