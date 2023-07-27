import { LightningElement,track } from 'lwc';
import getStudentDetails from '@salesforce/apex/StudentContoller.getStudentDetails';
   
export default class DevImperativeMethod extends LightningElement {
    @track students;
    @track error;
    handleLoad()
    {
        getStudentDetails()
        .then(result=>{
                this.students = result;
        })
        .catch(error =>
            {
                this.error = error;
            })
    }
    columns = [
        { label: 'Student Name', fieldName: 'Name' },
        { label: 'Student Branch', fieldName: 'Student_Branch__c ', type: 'text' }];
}