global class ContactUpdateBatch implements Database.Batchable<sObject>
{
    Set<Id> accntId = new Set<Id>();
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name,Qualification__c FROM Student__c';       
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Student__c> patientList)
    {
        for(Student__c a : patientList)
        {
            a.Qualification__c= a.Qualification__c+ '';
        }
        update patientList;
        
    }
    global void finish(Database.BatchableContext BC)
    {
        //batchExample be = new batchExample();
        //Database.executeBatch(be);
        //fututeExample.fututeExampleMethod(accntId);
    }
}