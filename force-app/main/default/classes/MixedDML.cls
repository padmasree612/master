@isTest
private class MixedDML {
    static testMethod void mixedDMLExample() {
          Test.startTest();
          
              Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
              UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
              
               User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
<<<<<<< HEAD
               System.runAs(thisUser){
=======
              System.runAs(thisUser){
>>>>>>> 33cfbdb (initial commit)
              
              
              User u = new User(); 
              u.alias = 'jsmith';
              u.email='jsmith@acme.com'; 
              u.emailencodingkey='UTF-8';          
              u.lastname='Smith';
              u.languagelocalekey='en_US'; 
              u.localesidkey='en_US'; 
              u.profileid = p.Id; 
              u.userroleid = r.Id; 
              u.timezonesidkey='America/Los_Angeles';  
              u.username='jsmith126@acme.com';   
              insert u; 
              
              List<Account> accList = new List<Account>();
              Account acc = new Account();
              acc.Name ='Testaccname';
              accList.add(acc);
              
              insert accList;
              
              System.assertNotEquals(accList.size(),2,'Account Created');
          }
          
          Test.stopTest();          
        
         }
        
    
}