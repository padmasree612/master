@RestResource(urlmapping='/restexmple/')
global class Account_RestExample
{
    /*   /services/apexrest/restexmple/?id=0015j00000z3Dpq */
    @HttpGet
    global static Account getAccountList()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params;
        String accId = paramsMap.get('id');
        acc = [select Id,Name from Account where id=:accId];
        return acc;
    }
    
    /**** /services/apexrest/restexmple/ ***/
    
    @HttpPost
    global static Account createAccount(String name,String phone)
    {
        Account acc =new Account();
        acc.Name = name;
        acc.Phone = phone;
        insert acc;
        return acc;
    }
    
     /*   /services/apexrest/restexmple/?id=0015j00000z3Dpq */
     
    @HttpPut
    global static String updateAccount(String name, String phone)
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params; 
        String accId = paramsMap.get('id');
        acc = [select Id,Name from Account where id=:accId];
        acc.Id = accId;
        acc.Name = name;
        acc.Phone = phone;
        update acc;
        return 'Account Updated';
        
    }
    
     /*   /services/apexrest/restexmple/?id=0015j00000z3Dpq */
    
    @HttpDelete
    global static String deleteAccount()
    {
        Account acc = new Account();
        Map<String,String> paramsMap = RestContext.request.params; 
        String accId = paramsMap.get('id');
        acc = [select Id,Name from Account where id=:accId];
        delete acc;
        return 'Account Deleted';
    }
}