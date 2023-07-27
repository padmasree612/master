global class updatephone_batch implements Database.Batchable<sObject> {
   global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account';
           return Database.getQueryLocator(query);
   }
   global void execute(Database.BatchableContext BC, List<Account> accList) {
   List<Account> updateAccount = new List<Account>();
       for(Account acc : accList)
        {      
              
            acc.Phone = '123';
            updateAccount.add(acc);
        }
       if(updateAccount.size()>0)
       {
           update updateAccount;
       }
        }
   
   global void finish(Database.BatchableContext BC) {
   }
    
   
}