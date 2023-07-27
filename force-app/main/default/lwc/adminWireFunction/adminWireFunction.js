import { LightningElement,wire } from 'lwc';
import fetchStudentDetails from '@salesforce/apex/AdminStudentController.fetchStudentDetails';
export default class AdminWireFunction extends LightningElement {
    searchKey ='';
    @wire (fetchStudentDetails,{searchKey :'$searchKey'})students;
    handleChangeEvent(event)
    {
        const searchKey = event.target.value;
        this.searchKey =searchKey;
    }
}