@isTest
public class OpportunityQueueableTest
{
    @isTest
    public static void OpportunityQueueableMethod()
    {
     Test.startTest();
         List<Opportunity> oppList = new List<Opportunity>();
         
         Opportunity opp = new Opportunity();
         opp.Name ='TestOpp';
         opp.Type ='New Customer';
         opp.Amount = 1000;
         opp.CloseDate = System.today();
         opp.StageName ='Prospecting';
         oppList.add(opp);
         
         insert oppList;
         
         System.enqueueJob(new OpportunityQueueable(oppList));
     
         
     Test.stopTest();
     
    }
}