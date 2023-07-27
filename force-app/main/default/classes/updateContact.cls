global class updateContact implements Database.Batchable<sObject>
{     
     
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'Select id,lastname from Contact limit 5';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> cons)
    {
    
        List<Contact> contactList = new List<Contact>();  
       
        
        for(Contact con : cons)
        {
            //acc.name = (acc.name).remove('Updated from Batch Apex');
            con.lastname = con.lastname + 'Updated from Batch Apex';
            contactList.add(con);
        }
        
         update contactList;
      }
    global void finish(Database.BatchableContext bc)
    {
        
    }
    }