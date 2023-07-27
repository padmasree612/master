@RestResource(urlMapping='/salesforcekid1/')
global class DemoRestAPI {
    @HttpGet
    global static Admin_Student__c getStudents(){
    Admin_Student__c students= new Admin_Student__c();
    Map<String,String> paramsMap = RestContext.request.params;
    System.debug('@@@@@@@RestApiTest@@@@@'+paramsMap.get('Id'));
    string studentId = paramsMap.get('Id');  
    System.debug('@@@@@@@TestpatientMap@@@@@'+studentId);  
    students =  [Select Id, Name,Student_Term_Fee__c From Admin_Student__c Where Id =: studentId];
    return students;
    }
    
    @HttpDelete
    global static String deleteStudents(){
    Admin_Student__c students= new Admin_Student__c();
    Map<string, string> patientsMap = RestContext.request.params;
    string studentId = patientsMap.get('Id');
    students= [Select Id, Name From Admin_Student__c Where Id =: studentId];
    Delete students;
    return 'Student Deleted';
    }
    
    @HttpPost
    global static Admin_Student__c createStudent(String Name,Integer TermFee){   
    Admin_Student__c students= new Admin_Student__c();
    students.Name = Name;
    students.Student_Term_Fee__c=TermFee;
    insert students;
    return students;  
    }
    
    @HttpPut
    global static String updateStudents(String Name,Integer TermFee){
    Admin_Student__c students= new Admin_Student__c();
    Map<string, string> patientsMap = RestContext.request.params;
    string studentId = patientsMap.get('Id');
    students= [Select Id, Name From Admin_Student__c Where Id =: studentId];
    students.id=studentId;
    students.Name = Name;
    students.Student_Term_Fee__c=TermFee;
    Update students;
    return 'Student Updated';
    }
    
    @HttpPatch
    global static Admin_Student__c upsertStudents(String Name,Integer TermFee){
    Admin_Student__c students= new Admin_Student__c();
    Map<string, string> patientsMap = RestContext.request.params;
    string studentId = patientsMap.get('Id');
    if(studentId!=null){
         students= [Select Id, Name From Admin_Student__c Where Id =: studentId];
         }
        students.id=studentId;
        students.Name = Name;
        students.Student_Term_Fee__c=TermFee;
        Upsert students;     
        return students;
    } 
    
   
   
    
    
      
}