trigger findnoofContacts on Contact (after insert,after update,after delete) {
    Set<Id> accntIds = new Set<Id>();
    if(Trigger.isInsert)
    {
        for(Contact con : Trigger.New)
        {
            System.debug('Display New Values '+Trigger.New);
            accntIds.add(con.AccountId);
        }
    } 
    if(Trigger.isDelete)
    {
        for(Contact con : Trigger.old)
        {
             System.debug('Display Old Values '+Trigger.old);
             accntIds.add(con.AccountId);
        }
    } 
    
    futureExamples.countContacts(accntIds);
   
    
    
 }