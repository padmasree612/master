trigger PreventDuplicateEmail on Contact (before insert,before update) {
    Set<String> emailSet =new Set<String>();
    List<String> emailList = new List<String>();
    for(Contact con:Trigger.new)
    {
        emailSet.add(con.email);
    }
    System.debug('Email Check' +emailSet);
    List<Contact> contactList =[Select id,Email from Contact where email =:emailSet];
    for(Contact c :contactList)        
    {
        emailList.add(c.Email);  
        System.debug('Display emailList' +emailList);
    }
    if(Trigger.isInsert)
    {
        for(Contact cont : Trigger.new)
        {
            if(emailList.contains(cont.Email))
            {
                cont.addError('Email Id already exists');                
            }
            
        }
        
    }
    if(Trigger.isUpdate)
    {
        for(Contact c: Trigger.new)
        {
            System.debug('Trigger oldMap' +Trigger.oldMap.get(c.id).Email +'Contact email' +c.Email);
            if(Trigger.oldMap.get(c.id).Email <> c.Email)
            {
                if(emailList.contains(c.Email))
                {
                    c.addError('Email Id already exists');                
                }
            }
        }
    }

}