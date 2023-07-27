import { LightningElement,wire } from 'lwc';
import fetchStudentDetails from '@salesforce/apex/StudentContoller.fetchStudentDetails';
export default class DevWireFunction extends LightningElement {
    searchKey='';
    @wire(fetchStudentDetails, {searchKey : '$searchKey'})students;
    handleChangeEvent(event){
        const searchKey=event.target.value;
        this.searchKey = searchKey;

    }
}