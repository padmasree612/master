public class opportunityTriggerHandler{

   
     public static void rollupFunctions(List<Opportunity> oppList){
        Set<Id> accountIds = new Set<Id>();
        List<Account> accountList = new List<Account>();
        for(Opportunity opp : oppList)
        {
           if(opp.AccountId != null)
           {
                accountIds.add(opp.AccountId);
           }    
        } 
        
        for(AggregateResult ag : [Select Count(Id)cnt, SUM(Amount)totalamnt, MAX(Amount)maxamnt, MIN(Amount)minamnt, AccountID 
        from Opportunity where AccountID IN: accountIds GROUP BY AccountID])
        {
            Account acc = new Account(Id=String.valueOf(ag.get('AccountID')));
            acc.No_of_Opportunities__c = Integer.valueof(ag.get('cnt'));
            acc.Total_Opp_Amount__c = Double.valueOf(ag.get('totalamnt'));
            acc.Max_Opp_Amnt__c = Double.valueOf(ag.get('maxamnt'));
            acc.Min_Opp_Amount__c = Double.valueOf(ag.get('minamnt'));
            accountList.add(acc);
        }
        update accountList;
    }
    public static void createTask(List<Opportunity> oppList)
    {
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList)
        {
            if(opp.StageName == 'Closed Won')
            {
                Task t = new Task();
                t.subject ='Created by Opportuniy';
                t.whatId = opp.id;
                taskList.add(t);
            }
        }
        insert taskList;
    }
   
    public void duplicateOpportunity(List<Opportunity> oppList)
    {
    if(RecursiveTriggerHandler.isFirstTime == true)
    {
        RecursiveTriggerHandler.isFirstTime = false;
        Map<String,Opportunity> oppMap = new Map<String,Opportunity>();
        for(Opportunity opp : oppList)
        {
           oppMap.put(opp.Name,opp);   
        }
        List<Opportunity> oppList1 = [Select Id,name from Opportunity where Name =:oppMap.keySet()];
        Map<String,Opportunity> nameMap = new Map<String,Opportunity>();
        for(Opportunity op : oppList)
        {
            nameMap.put(op.Name,op);
        }
        for(Opportunity opp : oppList)
        {
            if(nameMap.containsKey(opp.Name))
            {
                //opp.addError('Opportunity Name Exists');
            }
        }
    }
    }
    
    
}