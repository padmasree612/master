global class demoStundentBatch implements Database.Batchable<sObject> {   

List<Admin_Student__c> updateStudentList = new List<Admin_Student__c>();
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select id,name from Admin_Student__c';
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC,List<Admin_Student__c> stdList)
    {
        for(Admin_Student__c std : stdList)
        {
            std.Student_Phone__c = '8205745685';
            updateStudentList.add(std);
        }
     update updateStudentList;
    }
    global void finish(Database.BatchableContext BC)
    {
  
               
        
  }   
     
     

}