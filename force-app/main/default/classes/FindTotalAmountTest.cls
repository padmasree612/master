@isTest
private class FindTotalAmountTest
{
    static testMethod void findMethod1()
    {
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.name ='Test Account Name';
        accList.add(acc);
        insert accList;
        
        List<Opportunity> oppList = new List<Opportunity>();
        Opportunity opp = new Opportunity();
        opp.name ='Test Total Amount';
        opp.Amount =50;
        opp.accountId =acc.id;
        opp.TrackingNumber__c ='Testing';
        opp.StageName='Prospecting';
        opp.closedate = System.today();
        oppList.add(opp);
        insert oppList;
        
        List<Opportunity> oppList1 =[Select id from Opportunity where Id=:opp.id];
        delete oppList1;
        
    }
}