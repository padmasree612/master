public class searchPatientController {
    
    @AuraEnabled
    public static List<Patient__c> getPatientDetails()
    {
        List<Patient__c> patientList = [Select Id,Name,Patient_Branch__c,Term1_Fee__c from Patient__c];
        return patientList;
    }

}