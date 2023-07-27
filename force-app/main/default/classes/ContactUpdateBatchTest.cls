@isTest
public class ContactUpdateBatchTest{ 
 @testSetup
 static void ContactUpdateBatchMethod() {
     List<Class__c> classList = new List<Class__c>();
         Class__c cs = new Class__c();
         cs.Name ='TestClassname';
         classList.add(cs);
         insert classList;
         
     
     List<Student__c> stdList = new List<Student__c>();
         Student__c std = new Student__c();
         std.Name = 'TestName';
         std.Class__c = classList[0].id;         
         stdList.add(std);         
         insert stdList;
         System.assert(stdList.size() > 1,'List has one record');
         
         //System.assertNotEquals(stdList[0].name,'TestName1');
         
         Test.startTest();
             ContactUpdateBatch  cub = new ContactUpdateBatch ();
             Database.executeBatch(cub);
             
         ContactUpdateBatch_Schedulable sh1 = new ContactUpdateBatch_Schedulable ();
        String sch = '0 0 2 * * ?'; 
        system.schedule('Test Territory Check', sch, sh1); 
         Test.stopTest();
     
 }
 }