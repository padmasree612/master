global class batchExample implements Database.Batchable<sObject>,Database.AllowsCallouts {
   
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Id,Name,Phone FROM Account';
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
       
        // process each batch of records
        for(Account acc : accList)
         {        
               // Update the Account Name 
            acc.Type ='Prospect';
            AccountTriggerWebServiceHandler.sendAccountInfo(acc.Name,acc.Phone);
        }
       
            // Update the Account Record
            update accList;       
      
        }
        
    
        
        
        
     
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  }
}