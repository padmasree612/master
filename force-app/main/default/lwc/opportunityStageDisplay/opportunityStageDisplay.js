import { LightningElement,wire } from 'lwc';
import {getStageValues} from 'lightning/uiObjectInfoApi';
import {getObjectInfo } from 'lightning/uiObjectInfoApi';
import Opportunity_Object from '@salesforce/schema/Opportunity';
import oppStage  from '@salesforce/schema/Opportunity.StageName';
import getOpportunityList from '@salesforce/apex/opportunityController.getOpportunityList';
export default class OpportunityStageDisplay extends LightningElement {
    searchKey ='';

    @wire(getObjectInfo,{objectApiName : Opportunity_Object })
    objectinfo;

    @wire(getStageValues,{recordTypeId : '$objectInfo.data.defaultRecordTypeId',fieldApiname :oppStage})
    oppStageValues;

    @wire(getOpportunityList,{searchKey : '$searchKey'})
    opportunities

    handleChange(event)
    {
        const searchKey = event.target.value;
        this.searchKey = searchKey;
    }

}