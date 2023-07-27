import { LightningElement,wire } from 'lwc';
import getStudentDetails from '@salesforce/apex/StudentContoller.getStudentDetails'
export default class DevWreProperty extends LightningElement {
    @wire (getStudentDetails) students;  
    
  
}