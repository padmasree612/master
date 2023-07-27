trigger Demo_ConTriggers on Contact(before insert) { 
    Set<Id> accntIds = new Set<Id>();
    Map<String,Id> conAccMap = new Map<String,Id>();
    for(Contact con : Trigger.new)
    {
        if(con.AccountId != null)
        {
            accntIds.add(con.AccountId);
            System.debug('Display accountId '+accntIds);
        }
    }
    List<Contact> conList = [Select Id,lastname,AccountId from Contact where AccountId IN :accntIds]; 
    System.debug('Display contat list '+conList);
    for(Contact cons :conList)
    {
        conAccMap.put(cons.lastname,cons.AccountId);
        System.debug('conAccMap @@@@ '+conAccMap);
        System.debug('Get conAccMap Values '+conAccMap.get(cons.lastname));
    } 
    for(Contact cont : Trigger.New)    
    {
        System.debug('contact value '+conAccMap.get(cont.lastname) + 'Contact AccountID ' +cont.AccountId);
        if(cont.AccountId != null && conAccMap.get(cont.lastname) == cont.AccountId)
        {
            cont.addError('Contact already exists on this Account');
        }
    }
}