import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import Email_Field from '@salesforce/schema/Contact.Email';
export default class AdminRecordFormExample extends LightningElement {

    fields =[NAME_FIELD,Email_Field];    
    @api objectApiName = CONTACT_OBJECT;

    handleSuccess(event)
    {
        const toastEvent = new ShowToastEvent({
            title : 'Contact Created',
            message : 'Record Id '+event.detail.id,
            variant :'success'
        });
        this.dispatchEvent(toastEvent);
    }

}