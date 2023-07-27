public class insertAccountController {
    @AuraEnabled
    public static Account createAccount(Account acc)
    {
        insert acc;
        return acc;
        
    }
     

}