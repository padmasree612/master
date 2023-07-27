@isTest
public class PatientTriggerHandlerTest{ 
 @isTest
 static void PatientTriggerHandlerMethod() {
    
    List<Hospital__c> hospList = new List<Hospital__c>();
     Hospital__c hsp = new Hospital__c();
     hsp.Name = 'TestHospital';
     hospList.add(hsp);
     insert hospList;
 
     List<Patient__c> patList = new List<Patient__c>();
     Patient__c pat =new Patient__c();
     pat.Name ='Testname';
     pat.P_Number__c = 12345;
     pat.Term1_Fee__c = 1234;
     pat.Hospital__c = hospList[0].id;
     patList.add(pat);
     
     insert patList;
     
     
     
 }
 }