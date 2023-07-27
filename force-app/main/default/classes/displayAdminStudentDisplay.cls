public class displayAdminStudentDisplay
{
    @AuraEnabled
    public static List<Admin_Student__c> findStudentDetails()
    {
        List<Admin_Student__c> stdList = [Select id,name, Student_Phone__c from Admin_Student__c where Student_Phone__c !=null];
        return stdList;
    }
}