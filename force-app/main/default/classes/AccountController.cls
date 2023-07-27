public with sharing class AccountController {

    public Account accnt{ get; set; }
    
    public AccountController()
    {
        accnt = new Account();
    }
    
    public PageReference save()
    {
        insert accnt;
        PageReference ref = new ApexPages.StandardController(accnt).view();
        return ref;
    }
}