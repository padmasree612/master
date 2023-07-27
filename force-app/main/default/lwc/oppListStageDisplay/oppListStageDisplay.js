import { LightningElement,track,wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Opportunity_Object from '@salesforce/schema/Opportunity';
import oppStage from '@salesforce/schema/Opportunity.StageName';
import getOpportunityList from '@salesforce/apex/opportunityController.getOpportunityList';
export default class OppListStageDisplay extends LightningElement {
    searchKey = '';
    @track opportunities;
   // @track opportunites;
   oppStages = {    
    StageName : this.oppStage
}

   @wire(getObjectInfo, { objectApiName: Opportunity_Object})
   objectInfo

   @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: oppStage})
   oppPicklistValues;

   @wire(getOpportunityList, { searchKey: '$searchKey' })
   opportunities;
    
    handleChange(event)
    {      
        
        const searchKey = event.target.value;
        this.searchKey = searchKey;

    }
    
  
        
}