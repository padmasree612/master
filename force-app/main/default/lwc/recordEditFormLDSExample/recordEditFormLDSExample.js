import { LightningElement, api} from 'lwc';
export default class RecordEditFormEditExampleLWC extends LightningElement {
    @api recordId;
    handleSubmit(event) {
        const values = event.detail.fields;
        console.log('onsubmit event recordEditForm'+JSON.stringify(values));
        }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
    }
}