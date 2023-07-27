public class VisualforceEmailTemplateController {
    //Get account id passed in from email template
    public static Id emailAccountId { get; set; }

    //Return a list of contacts for the associated account
    public static List<Contact> getAccountContacts(){
        return [SELECT Id, Name FROM Contact WHERE AccountId =: emailAccountId];
    }

}