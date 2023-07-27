public with sharing class AdminStudentController
{
    @AuraEnabled
    public static List<Admin_Student__c> getStudentDetails()
    {
        List<Admin_Student__c> stdList = [Select Id,Name,Student_Phone__c from Admin_Student__c where Student_Branch__c!=null];
        return stdList;
    }
    @AuraEnabled(cacheable=true)
    public static List<Admin_Student__c> fetchStudentDetails(String searchKey)
    {
        String strKey ='%'+searchKey+'%';
        List<Admin_Student__c> stdList = [Select Id,Name,Student_Phone__c from Admin_Student__c where Name Like:strKey];
        return stdList;
    }
    @AuraEnabled
    public static void insertStudent(Admin_Student__c std)
    {
        insert std;
    }
}