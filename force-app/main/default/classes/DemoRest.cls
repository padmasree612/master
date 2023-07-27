@RestResource(urlMapping='/salesforcekid2/')
global class DemoRest
{
    @HttpGet
    global static Account getaccounts()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        System.debug(paramsMap.get('id')+' @@@@Test paramsMap '+paramsMap);
        String accId = paramsMap.get('id');
        acc = [Select Id,Name,Phone from Account where Id=:accId];
        return acc;
    }
    
    @HttpPost
    global static Account createAccount(String name,String phone)
    {
       System.debug('acc Name '+ name +' acc Phone'+phone);
         Account acc = new Account();
         acc.Name = name;
         acc.Phone= phone;
         insert acc;
         return acc;
    }
    
    @HttpPut
    global static String updateAccount(String name,String phone)
    {
    Account acc = new Account();
    Map<String,String> paramsMap = RestContext.request.params;
    System.debug(paramsMap.get('id')+' @@@@Test paramsMap '+paramsMap);
    String accId = paramsMap.get('id');
    acc = [Select Id,Name,Phone from Account where Id=: accId];
    acc.Id =accId;
    acc.Name = name;
    acc.Phone= phone;
    update acc;
    return 'Account Updated';
    }
    
    @HttpDelete
    global static String deleteAccount()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        System.debug(paramsMap.get('id')+' @@@@Test paramsMap '+paramsMap);
        String accId = paramsMap.get('id');
        acc = [Select Id,Name,Phone from Account where Id=: accId];
        delete acc;
        return 'Account Deleted';
    
    }
}