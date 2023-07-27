public class OpportunityQueueable implements Queueable
{
    public List<Opportunity> oppList;
    public OpportunityQueueable(List<Opportunity> oppList)
    {
        this.oppList = oppList;
    }
    public void execute(QueueableContext context)
    {
        for(Opportunity opp : oppList)
        {
            opp.Description = 'Updated from Queueable';            
        }
        update oppList;
       
     }
     List<Account> accountList = [Select id,Name from Account];
     Id jobId = System.enqueueJob(new AccountQueueableExample(accountList));
     
}