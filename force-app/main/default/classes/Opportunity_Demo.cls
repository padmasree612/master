global class Opportunity_Demo  implements Database.Batchable<sObject>,Database.stateful {
         public string csvBody ='';
         String finalCsv ='';
         public string headerValue ='Opportunity Id, Error Message \n';
        List<Opportunity> oppListUpdate = new List<Opportunity>();
        List<Database.SaveResult> updateResult = new List<Database.SaveResult>();
        global Database.QueryLocator start(Database.BatchableContext BC)
        {
            String query = 'SELECT Id,Name FROM Opportunity';        
            return Database.getQueryLocator(query);
        }
        global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
            for(Opportunity opp : oppList)
            {
                opp.closedate = System.today();
                oppListUpdate.add(opp);
            }
        updateResult = Database.update(oppListUpdate,false);
        System.debug('@@@@@@check the result of save result@@@@@'+updateResult);
        System.debug('@@@@@@check the result of size result@@@@@'+updateResult.size());
        if(updateResult!=null && !updateResult.isEmpty())
        {
            for(Integer index = 0 ; index < updateResult.size() ; index ++){
            string errorMsg = '';
             System.debug('@@@@@@check the result of getErrors result@@@@@'+updateResult[Index].isSuccess());
                if(!updateResult[index].isSuccess() ){
                   csvBody += oppListUpdate.get( index ).Id + ',';
                   System.debug('@@@@@@check the result of getErrors result@@@@@'+updateResult[index].getErrors());
                    for(Database.Error error : updateResult[index].getErrors()){
                        errorMsg += error.getMessage() + ',';
                    }
                    errorMsg = errorMsg.removeEnd(',');
                            System.debug('Error Message removeEnd' +errorMsg.removeEnd(','));
                            csvBody += '"'+errorMsg + '"' + ','; 
                            csvBody += '\n';
                }
                if(csvBody != null && csvBody != ''){
                        finalCsv = headerValue + csvBody;
                        System.debug('Display finalCsv' +finalCsv);
                    }
            }
            
        }
            
        }
        global void finish(Database.BatchableContext BC){
        System.debug('testfinishmethod');
        if( finalCsv != null && finalCsv != ''){

            String csvname= 'Opportunity_Update_Errors.csv';
            Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            csvAttc.setFileName(csvname);
            System.debug('Display after Blob' +(Blob.valueOf(finalCsv)));
            csvAttc.setBody(Blob.valueOf(finalCsv));
            list<string> toAddresses = new list<string>();
            toAddresses.addAll(new List<String>{'Archerkblaze@live.com'});
            String subject ='Opportunity Update Error:'; 
            Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
            email.setSubject(subject);
            email.setToAddresses(toAddresses );
            //email.setPlainTextBody(errorString );
            email.setPlainTextBody('PFA success and error file attached.');
            email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
            System.debug('check email sent'+email);
               
        }
    }
    
        
        
}