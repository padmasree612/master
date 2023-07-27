public class insertStudentRecords
{
    @AuraEnabled
    public static Admin_Pravalika_Student__c createStudent(Admin_Pravalika_Student__c std)
    {
        insert std;
        return std;
    }
}