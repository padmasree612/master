global class updateAccount implements Database.Batchable<sObject>
{     
     
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'Select id,name from Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> accs)
    {
    
        updateStudent(accs);
         
        
      }
      private void updateStudent(List<Account> accs)
      {
          List<Account> accountList = new List<Account>();  
       
        
        for(Account acc : accs)
        {
            //acc.name = (acc.name).remove('Updated from Batch Apex');
            acc.Name = acc.name + 'Updated from Batch Apex';
            acc.Email__c = 'test@yopmail.com';
            accountList.add(acc);
        }
        
         update accountList;
      }
    global void finish(Database.BatchableContext bc)
    {
    
        /*updateContact upa = new updateContact();
        Database.executeBatch(upa);*/
        
        /*List<Admin_Student__c> studList = [Select id,name from Admin_Student__c];
        Id JobId = System.enqueueJob(new StudentQueueable(studList));*/
        
    }
    }