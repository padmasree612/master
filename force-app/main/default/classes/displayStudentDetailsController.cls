public class displayStudentDetailsController {
    @AuraEnabled
    public static List<Admin_Pravalika_Student__c> getStudentDetails()
    {
        List<Admin_Pravalika_Student__c> stdList =[Select Id,Name,Student_Term_Fee1__c,Student_Branch__c from Admin_Pravalika_Student__c];
        return stdList;
    }

}