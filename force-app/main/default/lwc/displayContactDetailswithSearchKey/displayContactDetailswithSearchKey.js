import { LightningElement,wire } from 'lwc';
import findContacts from '@salesforce/apex/getContactList.findContacts';
export default class DisplayContactDetailswithSearchKey extends LightningElement {
 searchKey = '';
 @wire(findContacts, { searchKey: '$searchKey' })
    contacts;
    
    handleKeyChange(event)
    {
        this.searchKey = event.target.value;
        
        
    }    
     
}