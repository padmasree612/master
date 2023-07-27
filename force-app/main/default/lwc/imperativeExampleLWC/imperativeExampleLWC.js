import { LightningElement,track } from 'lwc';
import getContactList from '@salesforce/apex/contactcontroller.getContactList';
export default class ImperativeExampleLWC extends LightningElement {
        @track contacts;
        @track error;
        handleLoad()
        {
            getContactList()
                .then(result=>
                    {
                        this.contacts=result;
                        console.log('Display contacts' +JSON.stringify(this.contacts));
                    })
                    .catch(error=>{
                       this.error = error; 
                    })
        }

}