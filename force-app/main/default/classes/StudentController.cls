public with sharing class StudentController{

    public StudentController(ApexPages.StandardController controller) {

    }
    
   
    List<Class__c> class1 = [select id from Class__c];   
    public Student__c  std{set;get;}
    Public Transient Integer currentTotal;
       
    public void SaveRecord(){
        Student__c std= New Student__c ();
        std.name='demostudent';      
        std.Class__c=class1[0].id;
        insert std;
    }
}