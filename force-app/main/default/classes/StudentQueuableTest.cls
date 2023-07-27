@isTest
public class StudentQueuableTest{ 
 @isTest
 static void StudentQueuableMethod1() {
       List<Demo_College__c> classList = new List<Demo_College__c>();
         Demo_College__c cs = new Demo_College__c();
         cs.Name ='TestClassname';
         classList.add(cs);
         insert classList;
         
     
     List<Demo_Student__c> stdList = new List<Demo_Student__c>();
         Demo_Student__c std = new Demo_Student__c();
         std.Name = 'TestName';
         std.Demo_College__c= classList[0].id;
         stdList.add(std);         
         insert stdList;
         
         Test.startTest();
           StudentQueuable SQ = new StudentQueuable(stdList);
           Id jobId = System.enqueueJob(SQ);

         Test.stopTest();
         
 }
 }