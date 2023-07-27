@isTest
public class UserAndContactTest {
    public testmethod static void testUserAndContact() {
        InsertFutureUser.insertUser();
        Contact currentContact = new Contact(
            firstName = String.valueOf(System.currentTimeMillis()),
            lastName = 'Contact');
        insert(currentContact);
    }
}