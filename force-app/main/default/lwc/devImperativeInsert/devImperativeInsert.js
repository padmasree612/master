import { LightningElement,track } from 'lwc';
import insertStudent from '@salesforce/apex/StudentContoller.insertStudent';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import stdName from '@salesforce/schema/Admin_Pravalika_Student__c.Name';
import stdPhone from '@salesforce/schema/Admin_Pravalika_Student__c.Student_Phone__c';
import stdtermFee from '@salesforce/schema/Admin_Pravalika_Student__c.Student_Term_Fee1__c';
export default class DevImperativeInsert extends LightningElement {
        @track error;

        @track getStudentRecord ={
            Name : stdName,
            Student_Phone__c : stdPhone,
            Student_Term_Fee1__c : stdtermFee

        }
        

    nameChange(event)
    {
        this.getStudentRecord.Name = event.target.value;
    }
    phoneChange(event)
    {
        this.getStudentRecord.Student_Phone__c = event.target.value;
    }
    termFeeChange(event)
    {
        this.getStudentRecord.Student_Term_Fee1__c = event.target.value;
    }

    createStudentRec()    
    {
        insertStudent({std : this.getStudentRecord })
        .then(result =>
            {
                this.getStudentRecord ={};
                const event = new ShowToastEvent({
                    title : 'Success',
                    message : 'Student Created Successfully',
                });
                this.dispatchEvent(event);
            })
            .catch(error=>
                {
                    this.error = error.message;
                })
    }


}