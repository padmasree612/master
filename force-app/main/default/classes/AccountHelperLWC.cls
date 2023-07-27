public with sharing class AccountHelperLWC {
   @AuraEnabled
    public static List<Account> getAccountList()
    {
         return [SELECT Id,Name,Phone FROM Account WHERE Phone != null limit 10];
    }
    

}