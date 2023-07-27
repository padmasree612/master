@isTest
public class opportunityTriggerHandlerTest
{
    public static testMethod void opphandlertest()
    {
        Account acc = new Account();
        acc.Name ='TestAccount';
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Testopp';
        opp.closedate =System.today();
        opp.Amount = 1000;
        opp.Type ='New Customerr';
        opp.StageName='Closed Won';
        opp.AccountId = acc.Id;
        
        insert opp;
    }
}