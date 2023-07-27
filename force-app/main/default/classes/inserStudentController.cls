public with sharing class inserStudentController {

     public Demo_Student__c std{set;get;}
     
        public void SaveRecord(){
        Demo_College__c college =new  Demo_College__C();
        insert college;
        
        Demo_Student__c std= New Demo_Student__c();
        std.Demo_College__c =college.id;
        insert std;
    }
}