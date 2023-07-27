global class OpportunityBatch implements Database.Batchable<sObject> {

    public string csvBody ='';
    public string successBody;
    String finalCsv ='';
    public string headerValue ='Opportunity Id, Erroer Message \n';
   List<Database.SaveResult> updateResult = new List<Database.SaveResult>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Id,Name FROM Opportunty where status=\'closed\'';
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList) {
       
        // process each batch of records
        List<Opportunity> opList = new List<Opportunity>();
        for(Opportunity opp : oppList)
         {        
               // Update the Account Name 
            opp.CloseDate = System.today();
            opList.add(opp);
        }
       
            // Update the Account Record
    updateResult = Database.update(opList,false);  
         if( updateResult != null && !updateResult.isEmpty()){
                String errorString = '';
                for(Integer index = 0 ; index < updateResult.size() ; index ++){
                    if(!updateResult[index].isSuccess() ){
                        csvBody += opList.get( index ).Id + ',';
                        string errorMsg = '';
                        
                        for(Database.Error error : updateResult[index].getErrors()){
                                errorMsg += error.getMessage() + ',';
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
            String csvname= 'Opportunity_Update_Errors.csv';
            Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            csvAttc.setFileName(csvname);
            csvAttc.setBody(Blob.valueOf(finalCsv));
            list<string> toAddresses = new list<string>();
            toAddresses.addAll(new List<String>{'padmasree.darapuneni@gmail.com'});
            String subject ='Opportunity Update Error:'; 
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