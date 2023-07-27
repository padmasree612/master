public class insertAdminStucentController {
    @AuraEnabled
    public static Admin_Student__c insertStudent(Admin_Student__c std)
    {
        insert std;
        return std;
    }

}