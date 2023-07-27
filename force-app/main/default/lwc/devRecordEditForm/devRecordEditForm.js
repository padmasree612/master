import { LightningElement,api } from 'lwc';

export default class DevRecordEditForm extends LightningElement {
   @api recordId;
    handleSucces(event)
    {
        console.log('Success Notification ' +event.detail.id);
        }

        handleSubmit(event)
        {
            const values = event.detail.fields;
            console.log('Submit Notification ' +JSON.stringify(values));
        }
}