import { LightningElement,track,wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import RELATIONSHIP_OBJECT from '@salesforce/schema/LWC_Relationship__c';
import NAME_FIELD from '@salesforce/schema/LWC_Relationship__c.Name';
import SEGMENT_FIELD from '@salesforce/schema/LWC_Relationship__c.Effective_Segment__c';
import ORIGINATOR_FIELD from '@salesforce/schema/LWC_Relationship__c.Originator_1__c';
import LWCRelationRecMethod from '@salesforce/apex/LWCRelationshipHelper.LWCRelationRecMethod';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Insert_LWC_Relationship extends LightningElement {
    @track name = NAME_FIELD;
    @track segment = SEGMENT_FIELD;

    recRelationShip = {
        Name : this.name,
        Effective_Segment__c : this.segment
    } 
    
    @wire(getObjectInfo, { objectApiName: RELATIONSHIP_OBJECT})
    objectInfo

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: SEGMENT_FIELD})
    SegmentPicklistValues;

    handleNameChange(event)
    {
        this.recRelationShip.Name = event.target.value;
        console.log('Test Relationship Name '+this.recRelationShip.Name);
    }
    handleSegmentChange(event)
    {
        this.recRelationShip.Effective_Segment__c = event.detail.value;
        
    } 
    handleOriginatorSelection(event)
    {
        this.recRelationShip.Originator_1__c = event.target.value;
    }
    createRec()
    {
        LWCRelationRecMethod({ lwcrelRec : this.recRelationShip})
        .then(result =>     {
            this.message = result;
            this.error = undefined;
            if(this.message !== undefined) {
                this.recRelationShip.Name = '';
                this.recRelationShip.Effective_Segment__c='';
                this.Originator_1__c ='';
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Relationship is created',
                        variant: 'success',
                    }),
                );
            }
        })
  
.catch(error => {
    this.message = undefined;
    this.error = error;
    this.dispatchEvent(
        new ShowToastEvent({
            title: 'Error creating record',
            message: error.body.message,
            variant: 'error',
        }),
    );
    console.log("error", JSON.stringify(this.error));
});
 
}   
}