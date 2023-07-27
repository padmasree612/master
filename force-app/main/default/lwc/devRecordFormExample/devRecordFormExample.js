import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import CASE_OBJECT from '@salesforce/schema/Case';
import Origin_Field from '@salesforce/schema/Case.Origin';
import Status_Field from '@salesforce/schema/Case.Status';
import SuppliedEmail_Field from '@salesforce/schema/Case.SuppliedEmail';
export default class DevRecordFormExample extends LightningElement {
    objectApiName = CASE_OBJECT;
    fields =[Origin_Field,Status_Field,SuppliedEmail_Field];
    handleSuccess(event)
    {
            const toastEvent = new ShowToastEvent({
                title : "Case Created",
                message : "Record ID: " +event.detail.id,
                varaiant : "success"
            });
            this.dispatchEvent(toastEvent);

    }
}