import { LightningElement,api} from 'lwc';
export default class AdminRecordEditForm extends LightningElement {
        @api recordId;
        handleSubmit(event)
        {
            const values = event.detail.fields;
            console.log('Submit Notificcation '+JSON.stringify(values));
        }
        handleSuccess(event)
        {
            console.log('success notification '+event.detail.id);
        }

}