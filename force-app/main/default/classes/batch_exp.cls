global class batch_exp implements Database.Batchable<sObject> {
   global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account';
           return Database.getQueryLocator(query);
   }
   global void execute(Database.BatchableContext BC, List<Account> accList) {
   Set<id> accntIds = new Set<id>();
   
   List<Account> updateAccount = new List<Account>();
       for(Account acc : accList)
        { 
             
              
            acc.Name = acc.name +'StatusAsyncApexJob';
            updateAccount.add(acc);
            accntIds.add(acc.id);

        }
       if(updateAccount.size()>0)
       {
           update updateAccount;
       }
      
        
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