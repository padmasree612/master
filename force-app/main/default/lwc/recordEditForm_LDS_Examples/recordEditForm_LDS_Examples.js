import { LightningElement,api } from 'lwc';
export default class RecordEditForm_LDS_Examples extends LightningElement {
    @api recordId;

    handleSuccess(event)
    {
        console.log('onsuccess event '+event.detail.id);
    }
    handleSubmit(event)
    {
        const values = event.detail.fields;
    }
}