@RestResource(urlMapping='/AccountRest/*')
global Class AccountRest
{
    @HttpGet
    global static Account getaccounts()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        String accId = paramsMap.get('id');
        acc = [Select Id,Name from Account where id=:accId];
        return acc;
    }
    
    @HttpPost
    global static Account createAccount(String name,String phone)
    {
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        insert acc;
        return acc;
    }
    
    @HttpPut
    global static String updateAccount(String name,String phone)
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        String accId = paramsMap.get('id');
        acc = [Select Id,Name from Account where id=:accId];
        acc.Id = accId;
        acc.Name = name;
        acc.Phone = phone;
        update acc;
        return 'Account Record Updated';    
        
        
    }
    @HttpDelete
    global static String deleleAccount()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        String accId = paramsMap.get('id');
        acc = [Select Id,Name from Account where Id=:accId];
        delete acc;
        return 'Account Deleted';
    }
}