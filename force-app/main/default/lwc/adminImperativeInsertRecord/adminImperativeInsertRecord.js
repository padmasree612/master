import { LightningElement,track } from 'lwc';
import insertStudent from '@salesforce/apex/AdminStudentController.insertStudent';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import stdName from '@salesforce/schema/Admin_Student__c.Name';
import stdPhone from '@salesforce/schema/Admin_Student__c.Student_Phone__c';
import stdTermFee from '@salesforce/schema/Admin_Student__c.Student_Term_Fee__c';
export default class AdminImperativeInsertRecord extends LightningElement {

    @track getStudentRecord ={
        Name :stdName,
        Student_Phone__c : stdPhone,
        Student_Term_Fee__c : stdTermFee

    }
    nameChange(event)
    {
        this.getStudentRecord.Name=event.target.value;
    }
    phoneChange(event)
    {
        this.getStudentRecord.Student_Phone__c=event.target.value;
    }
    marksChange(event)
    {
        this.getStudentRecord.Student_Term_Fee__c=event.target.value;
    }
    createStudentRec()
    {
        insertStudent({std : this.getStudentRecord})
        .then(result => {
            this.getStudentRecord ={};
            const event = new ShowToastEvent({
                title: 'Success',
                message:
                    'Student Record  created'
            });
            this.dispatchEvent(event);
           
            })
            .catch(error =>{
                this.error = error.message;

            });
            
        
    }
}