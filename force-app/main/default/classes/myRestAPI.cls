@RestResource(urlMapping='/salesforcekid/')
global class myRestAPI {
    @HttpGet
    global static Patient__c getPatients(){
    Patient__c patients= new Patient__c();
    Map<String,String> paramsMap = RestContext.request.params;
    System.debug('@@@@@@@RestApiTest@@@@@'+paramsMap.get('Id'));
    string patientId = paramsMap.get('Id');  
    System.debug('@@@@@@@TestpatientMap@@@@@'+patientId);  
    patients =  [Select Id, Name From Patient__c Where Id =: patientId];
    return patients;
    }
    
    @HttpDelete
    global static String deletePatients(){
    Patient__c patients= new Patient__c();
    Map<string, string> patientsMap = RestContext.request.params;
    string patientId = patientsMap.get('Id');
    patients = [Select Id, Name From Patient__c Where Id =: patientId];
    Delete patients;
    return 'Patient Deleted';
    }
    
    @HttpPost
    global static Patient__c createPatient(String Name){   
    Patient__c patients = new Patient__c();
    patients.Name = Name;
    insert patients;
    return patients;  
    }
    
      
}