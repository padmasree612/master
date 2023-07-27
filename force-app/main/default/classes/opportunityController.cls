public class opportunityController
{
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList(String searchKey)
    { 
        String strKey='%'+searchKey+'%';  
        List<Opportunity> oppList = [Select Id,Name,StageName from Opportunity where StageName LIKE:strKey];
        return oppList;
    }
    
    @AuraEnabled 
    public static List<String> getStageValues(){
         List<String> options = new List<String>();        
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {            
            options.add(p.getValue());
        }
        return options;
    }

}