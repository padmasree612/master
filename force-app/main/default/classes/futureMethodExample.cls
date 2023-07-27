public class futureMethodExample
{
    @future
    public static void countContats(String jsonString)
    {
         List<Contact> contactList = (List<Contact>)Json.deserialize(jsonString,List<Contact>.class);
         System.debug('Display Contact List '+contactList);
    }
}