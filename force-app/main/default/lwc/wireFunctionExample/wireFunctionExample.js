import { LightningElement,wire } from 'lwc';
import getContactList from '@salesforce/apex/contactcontroller.getContactList';
export default class WireFunctionExample extends LightningElement {
    contacts;
    error;
    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
}