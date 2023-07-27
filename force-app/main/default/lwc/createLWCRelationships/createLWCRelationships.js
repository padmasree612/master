import { LightningElement,track } from 'lwc';
import Name_Field from '@salesforce/schema/LWC_Relationship__c.Name';
import LWC_Number from '@salesforce/schema/LWC_Relationship__c.LWC_Relationship_Number__c';
import LWCRelationRecMethod from '@salesforce/apex/LWCRelationshipHelper.LWCRelationRecMethod';
import getLWCRelDetails from '@salesforce/apex/LWCRelationshipHelper.getLWCRelDetails';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class CreateLWCRelationships extends LightningElement {
    @track relationships;
    @track getLWCRelationRecord ={
        Name : Name_Field,
        LWC_Relationship_Number__c : LWC_Number
    }

    handlenamechange(event){
        this.getLWCRelationRecord.Name = event.target.value;
    }

    handlenumberchange(event)
    {
        this.getLWCRelationRecord.LWC_Relationship_Number__c = event.target.value;  
    }
    createRelRec()
    {
        LWCRelationRecMethod({lwcrelRec : this.getLWCRelationRecord})        
        .then(result =>{
            alert('Testing relationships '+JSON.stringify(this.getLWCRelationRecord));
            this.getLWCRelationRecord ={};
            const toastEvent = new ShowToastEvent({
                title :'Success',
                message : 'Relationship created successfully',
                variant : 'success'
            });
            this.dispatchEvent(toastEvent);
        })
            .catch(error=>
                {
                    this.error = error.message;                    
                });

        
    }
    nextRelRec()
    {
        alert('Test Rel Number ');
        getLWCRelDetails({relNumber :  this.getLWCRelationRecord.LWC_Relationship_Number__c})
        .then(result => {
            this.relationships = result;
            alert('Test Relationship Values '+JSON.stringify(result));
            if(result != null)
            {
                this.getLWCRelationRecord.LWC_Relationship_Number__c = result.LWC_Relationship_Number__c;
                this.getLWCRelationRecord.Name = result.Name;
                alert('Test Relationship if state Values '+this.getLWCRelationRecord.Name);
            }
            else{
                this.getLWCRelationRecord.Name = '';
            }

        })
        .catch(error =>{
            this.error = error.message;
        })
    }
}