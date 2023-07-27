global class demoStundentsBatch implements Database.Batchable<sObject>,Database.stateful {  
     
   
    List<Admin_Pravalika_Student__c> updateStudent = new List<Admin_Pravalika_Student__c>();
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String stdList ='Select Id,Name from Admin_Pravalika_Student__c';
        return Database.getQueryLocator(stdList);
    }
    global void execute(Database.BatchableContext bc,List<Admin_Pravalika_Student__c> students)
    {
        for(Admin_Pravalika_Student__c std : students)
        {
            std.Student_DOB__c = System.today();
            updateStudent.add(std);
        }
     update updateStudent;
               
    }
    global void finish(Database.BatchableContext bc)
    {
   
    }
}