import { LightningElement,wire } from 'lwc';
import getStudentDetails from '@salesforce/apex/AdminStudentController.getStudentDetails';
export default class AdmnWireDecorator extends LightningElement {
    @wire(getStudentDetails) students;
}