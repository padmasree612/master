import { LightningElement,wire } from 'lwc';
import getContactList from '@salesforce/apex/contactcontroller.getContactList';
export default class DisplayContactList extends LightningElement {
    @wire (getContactList) contacts    

}