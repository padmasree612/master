public class searchLWCRelationshipController
{
    @AuraEnabled(cacheable=true)
    public static List<LWC_Relationship__c> getRelationshipData(String textkey,String textPickValue)
    {
        textkey = '%' + textkey +'%';
        textPickValue =  '%' + textPickValue +'%';
        System.debug('Display textkey '+textkey);
         System.debug('Display textPickValue '+textPickValue);
        List<LWC_Relationship__c> relationList = [SELECT Id,Name,CRM_Role__c FROM LWC_Relationship__c WHERE Name LIKE: textkey
        AND CRM_Role__c LIKE :textPickValue];
        
        if(relationList.isEmpty())
        {
            throw new AuraHandledException('No Records Found');
        }
        return relationList;
        
        
    }
}