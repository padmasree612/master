@isTest
public class futureExamplesTest
{
    @isTest
    public static void futureExampleMethod()
    {
        Test.startTest();
        Account acc = new Account();
        acc.Name ='Testname';
        insert acc;
        
        Contact con = new Contact();
        con.lastName ='testcontact';
        con.email='padma@gmail.com';
        con.AccountId = acc.Id;
        insert con;
        
        Set<Id> accntId = new Set<Id>();
        accntId.add(acc.Id);
        
        futureExamples.countContacts(accntId);
        Test.stopTest();
    }
}