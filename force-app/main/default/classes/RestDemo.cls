@RestResource(urlMapping ='/accountrest/')
global class RestDemo
{
    @HttpGet
    global static Account getAccounts()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        System.debug('@@@@@ Display paramsMap @@@' +paramsMap+'@@@@ parmas Id ' +paramsMap.get('id'));
        String accid = paramsMap.get('id');
        acc = [Select Id,name from Account where id=:accid];
        return acc;
    }
    
    @HttpPost
    global static Account createAccount(String name, String phone)
    {
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        insert acc;
        return acc;
    }
    
    @HttpPut
    
    global static String updateAccount(String name, String phone)
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;     
        String accid = paramsMap.get('id');
        acc.id = accid;
        acc.Name = name;
        acc.Phone = phone;
        update acc;
        return 'Account Updated';
    }
    
    @HttpDelete
    
    global static String deleteAccount()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;     
        String accid = paramsMap.get('id');
        acc = [Select Id,name from Account where id=:accid];
        delete acc;
        return 'Account Deleted';
    }
    
    
}