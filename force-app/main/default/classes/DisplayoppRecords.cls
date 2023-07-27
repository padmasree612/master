public class DisplayoppRecords
{
    @AuraEnabled
    public static List<Opportunity> getOppList(String strKey)
    {
        String searchKey = '%' +strKey+'%';
        List<Opportunity> oppList = [Select id,Name, StageName from Opportunity where StageName LIKE: searchKey];
        return oppList;
        
    }
    
    @AuraEnabled 
    public static List<String> getStageName(){
         List<String> options = new  List<String>();
        //get Account Industry Field Describe
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        //get Account Industry Picklist Values
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            //Put Picklist Value & Label in Map
            options.add(p.getValue());
        }
        return options;
    }
}