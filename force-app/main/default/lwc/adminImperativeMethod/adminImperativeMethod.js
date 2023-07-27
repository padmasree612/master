import { LightningElement,track } from 'lwc';
import getStudentDetails from '@salesforce/apex/AdminStudentController.getStudentDetails';

export default class AdminImperativeMethod extends LightningElement {
    @track students;
    @track error;   
    
    handleStudentLoad(){
        alert('handlestudentload');
        getStudentDetails()
        .then(result=>{
            this.students = result;
            console.log('Display Studnets'+JSON.stringify(this.students));
        })
        .catch(error=>
        {
            this.error = error;
            console.log('error'+error);
        })

        
    }
    columns = [
        { label: 'Student Name', fieldName: 'Name', type: 'text' },
        { label: 'Stundent Phone', fieldName: 'Student_Phone__c', type: 'text' }
       
    ];
    
}