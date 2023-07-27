import { LightningElement,track } from 'lwc';
import getContactList from '@salesforce/apex/contactcontroller.getContactList';
export default class ImperativeExamples extends LightningElement {

   @track contactList;
   @track showContacts;
  
   onShowClickSalesforce(){

       getContactList()
       .then(result => {
               this.contactList = result;
               this.showContacts = true;
       })
       .catch(error => {
           console.log('Errorured:- '+error.body.message);
       });
   }
   onHideClickSalesforce(){
       this.showContacts = false;
   }
}