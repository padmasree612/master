public   class contactcontroller {
    @AuraEnabled 
    public static List<Contact> getContactList()
    {
       return [select id,Name,Phone from Contact Limit 5];
   
    }
}