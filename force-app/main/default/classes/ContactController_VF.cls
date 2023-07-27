public with sharing class ContactController_VF {

    public Contact contact { get; set; }
    
    public ContactController_VF()
    {
        Id id = ApexPages.currentPage().getParameters().get('Id');
        contact = (Id==null)? new Contact():[Select id,FirstName,Lastname,Email from Contact where Id=:id];
        
    }
    
    public PageReference save()
    {
        upsert contact;
        PageReference ref = new Apexpages.StandardController(contact).view();
        return ref;
    }
}