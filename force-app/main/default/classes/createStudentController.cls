public with sharing class createStudentController {
   @AuraEnabled
   public static void saveStudent(Student__c studs){
    try {
        System.debug('Padma studs '+studs.id);
        if(studs.id !='')
        {
            System.debug('Padma studs upsert');
            upsert studs; 
        }
        
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
   @AuraEnabled
   public static Student__c getStudentDetails(String stdRoll){
    try { 
        
    List<Student__c>  s =new List<Student__c>();
    s = [select Id,Name,Student_Roll_Number__c from Student__c where Student_Roll_Number__c=:stdRoll Limit 1];
   
    if(!s.isEmpty())
    {
        return s[0];
    }
    else {
        return null;
    }
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
   
}