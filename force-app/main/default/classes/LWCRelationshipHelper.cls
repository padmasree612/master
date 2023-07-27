public with sharing class LWCRelationshipHelper
{
    @AuraEnabled
    public static LWC_Relationship__c LWCRelationRecMethod(LWC_Relationship__c lwcrelRec)
    {
        try
        {
            insert lwcrelRec;
            return lwcrelRec;
        }
        catch(Exception e)
        {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static LWC_Relationship__c getLWCRelDetails(String relNumber){
        try {
            List<LWC_Relationship__c> lwcrec = [select id,Name,LWC_Relationship_Number__c from LWC_Relationship__c where LWC_Relationship_Number__c =: relNumber limit 1];
            if(!lwcrec.isEmpty())
            {
                return lwcrec[0];
            }
            else 
            {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}