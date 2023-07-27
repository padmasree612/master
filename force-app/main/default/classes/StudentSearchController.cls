public class StudentSearchController {
    
    @AuraEnabled(Cacheable = true)
    public static list<Admin_Student__c> getStudentData(String textkey,String textPickValue) {
        textkey = '%' + textkey + '%';
        textPickValue = '%' + textPickValue + '%';
        list<Admin_Student__c> stdLst = [SELECT  Id, Name,Group__c From Admin_Student__c WHERE Name LIKE :textkey and Group__c LIKE:textPickValue ];
        
        if(stdLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return stdLst; 
    }
    

    
}