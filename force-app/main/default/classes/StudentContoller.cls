public class StudentContoller
{
    @AuraEnabled(cacheable=true)
    public static List<Admin_Pravalika_Student__c> getStudentDetails()
    {
        List<Admin_Pravalika_Student__c> stdList = [Select Id,Name,Student_Branch__c from Admin_Pravalika_Student__c where Student_Branch__c!=null];
        return stdList; 
    }
    @AuraEnabled(cacheable=true)
    public static List<Admin_Pravalika_Student__c> fetchStudentDetails(String searchKey)
    {
        String strKey ='%'+searchKey+'%';
        List<Admin_Pravalika_Student__c> stdList = [Select Id,Name,Student_Branch__c from Admin_Pravalika_Student__c where Name Like:strKey];
        return stdList; 
    }
    
    @AuraEnabled
    public static void insertStudent(Admin_Pravalika_Student__c std)
    {
        insert std;
    }
    
}