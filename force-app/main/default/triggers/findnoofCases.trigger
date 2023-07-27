trigger findnoofCases on Case (after insert,after update,after delete) {
    Set<Id> accntIds = new Set<Id>();
    if(Trigger.isInsert)
    {
        for(Case con : Trigger.New)
        {
            System.debug('Display New Values '+Trigger.New);
            accntIds.add(con.AccountId);
        }
    } 
    if(Trigger.isDelete)
    {
        for(Case con : Trigger.old)
        {
             System.debug('Display Old Values '+Trigger.old);
             accntIds.add(con.AccountId);
        }
    } 
    
    futureExamples.countContacts(accntIds);
   
    
    
 }