global class batch_exp_Queuable implements Database.Batchable<sObject> {
   global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name,LastName FROM Contact';
           return Database.getQueryLocator(query);
   }
   global void execute(Database.BatchableContext BC, List<Contact> conList) {
   Set<id> accntIds = new Set<id>();
   
    List<Contact> updateContact = new List<Contact>();
       for(Contact con : conList)
        { 
             
              
            con.LastName = con.LastName +'';
            updateContact.add(con);


        }
       if(updateContact.size()>0)
       {
           update updateContact;
       }      
      Id jobId = System.enqueueJob(new ContactPhoneQueueableExample(conList));  
   }
   
   global void finish(Database.BatchableContext BC) {
       //updatephone_batch updatePhone = new updatephone_batch();
      // Database.executeBatch(updatePhone);
      
      AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
      System.debug('@@@@@@@ Get AsyncApexJob Details@@@@ '+a+'@@@@getjobid@@@@@'+BC.getJobId());
      
   }
    
   
}