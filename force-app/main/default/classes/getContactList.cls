public class getContactList {
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        List<Contact> contList =[Select id,name from Contact where Name LIKE :key];
        return contList;
    }

}