global class Patient_Batch implements Database.Batchable<sObject>,Database.stateful {

    public string csvBody ='';
    public string successBody;
    String finalCsv ='';
    public string headerValue ='Patient Id, Erroer Message \n';
   List<Database.SaveResult> updateResult = new List<Database.SaveResult>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Id,Name FROM Patient__c';
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext BC, List<Patient__c> patientList) {
       
        // process each batch of records
        List<Patient__c> paList = new List<Patient__c>();
        for(Patient__c patient: patientList)
         {        
               // Update the Account Name 
            patient.P_DOB__c= System.today();
            paList.add(patient);
        }
       
            // Update the Account Record
    updateResult = Database.update(paList,false);  
         if( updateResult != null && !updateResult.isEmpty()){
                String errorString = '';
                for(Integer index = 0 ; index < updateResult.size() ; index ++){
                    if(!updateResult[index].isSuccess() ){
                        csvBody += paList.get( index ).Id + ',';
                        string errorMsg = '';
                        
                        for(Database.Error error : updateResult[index].getErrors()){
                               System.debug('####get ErrorMesssage####' +updateResult[index].getErrors()+'$$$$Database.error###'+error);
                                errorMsg += error.getMessage() + ',';
                                System.debug('####Display ErrorMesssage####' +errorMsg);
                            }
                            errorMsg = errorMsg.removeEnd(',');
                            csvBody += '"'+errorMsg + '"' + ','; 
                            csvBody += '\n';
                    }
                    if(csvBody != null && csvBody != ''){
                        finalCsv = headerValue + csvBody;
                    }
                }

         }     
      
        } 
     
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
        
        if( finalCsv != null && finalCsv != ''){
            String csvname= 'Patient_Update_Errors.csv';
            Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            csvAttc.setFileName(csvname);
            csvAttc.setBody(Blob.valueOf(finalCsv));
            list<string> toAddresses = new list<string>();
            toAddresses.addAll(new List<String>{'padmasree.darapuneni@gmail.com'});
            System.debug('$$$$$Testing Email#####' +toAddresses);
            String subject ='Patient Update Error:'; 
            Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
            email.setSubject(subject);
            email.setToAddresses(toAddresses );
            //email.setPlainTextBody(errorString );
            email.setPlainTextBody('PFA success and error file attached.');
            //email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc,successCsvAttc});
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
               
        }
  }
}