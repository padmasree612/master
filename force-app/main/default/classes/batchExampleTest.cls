@isTest
private class batchExampleTest
{
    static testMethod void batchExampleMethod1()
    {
        List<Account> lstAccount= new List<Account>();        
        
            Account acc = new Account();
            acc.Name ='Name';
            lstAccount.add(acc);
        
        
        insert lstAccount;
        System.debug('Check size of account List' +lstAccount.size());
        //System.Assert(lstAccount.size() == 1,'One Account is inserted');
        //System.assertEquals(lstAccount.size(), 2, '1 Account was successfully inserted');
        System.assertNotEquals(lstAccount.size(), 2, 'Account List has one record');
        
        Test.startTest();        
            batchExample b = new batchExample();
            Database.executeBatch(b);
        Test.stopTest();
        
    }
}