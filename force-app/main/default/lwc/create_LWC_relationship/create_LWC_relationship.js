import { LightningElement, track, wire} from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import RELATIONSHIP_OBJECT from '@salesforce/schema/LWC_Relationship__c';
import NAME_FIELD from '@salesforce/schema/LWC_Relationship__c.Name';
import SEGMENT_FIELD from '@salesforce/schema/LWC_Relationship__c.Effective_Segment__c';
import ORIGINATOR_FIELD from '@salesforce/schema/LWC_Relationship__c.Originator_1__c';
import BROKERAGE_FIELD from '@salesforce/schema/LWC_Relationship__c.Brokerage_Tier__c';
import CRM_FIELD from '@salesforce/schema/LWC_Relationship__c.CRM_Role__c';
import TEAMMATE_FIELD from '@salesforce/schema/LWC_Relationship__c.TeamMate__c';
import SPECIALITY_FIELD from '@salesforce/schema/LWC_Relationship__c.Speciality_Group__c';
import ORIGINATOR2_FIELD from '@salesforce/schema/LWC_Relationship__c.Originator_2__c';
import WEALTHRANK_FIELD from '@salesforce/schema/LWC_Relationship__c.Wealth_Rank__c';
import INTRODUCTION_FIELD from '@salesforce/schema/LWC_Relationship__c.Introduction_Type__c';
import LWCRelationRecMethod from '@salesforce/apex/LWCRelationshipHelper.LWCRelationRecMethod';
export default class Create_LWC_relationship extends LightningElement {

    @track Name = NAME_FIELD;
    @track segment = SEGMENT_FIELD;
    @track originator = ORIGINATOR_FIELD;
    @track brokerage = BROKERAGE_FIELD;
    @track crm = CRM_FIELD; 
    @track teammate = TEAMMATE_FIELD;
    @track speciality= SPECIALITY_FIELD;
    @track originator2 = ORIGINATOR2_FIELD;
    @track wealth = WEALTHRANK_FIELD;
    @track introduction = INTRODUCTION_FIELD;
    @track value;

    recRelationShip = {
        Name : this.Name,
        Effective_Segment__c : this.segment,
        Originator_1__c : this.originator,
        Brokerage_Tier__c : this.brokerage,
        CRM_Role__c : this.crm,
        TeamMate__c : this.teammate,
        Speciality_Group__c : this.speciality,
        Originator_2__c : this.originator2,
        Wealth_Rank__c : this.wealth,
        Introduction_Type__c : this.introduction
    }

    @wire(getObjectInfo, { objectApiName: RELATIONSHIP_OBJECT})
    objectInfo

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: SEGMENT_FIELD})
    SegmentPicklistValues;

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: BROKERAGE_FIELD})
    BrokeragePicklistValues;

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: CRM_FIELD})
    CrmPicklistValues;

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: SPECIALITY_FIELD})
    SpecialityPicklistValues;

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: WEALTHRANK_FIELD})
    WealthPicklistValues;

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: INTRODUCTION_FIELD})
    IndustryPicklistValues;
    handleNameChange(event)
    {
        this.recRelationShip.Name = event.target.value;
        console.log('Test Relationship Name '+this.recRelationShip.Name);
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

    createRec()
    {
        debbuger;
        LWCRelationRecMethod({ lwcrelRec : this.recRelationShip})
        console.log('Test value '+lwcrelRec)
                .this(result => {
                    this.message = result;
                    this.error = undefined;
                    if(this.message != undefined)
                    {
                        this.recRelationShip.Name ='';
                        this.recRelationShip.Effective_Segment__c ='';                       
                        //this.recRelationShip.Originator_1__c = '';
                        this.recRelationShip.Brokerage_Tier__c = '';
                        this.recRelationShip.CRM_Role__c = '';
                        //this.recRelationShip.TeamMate__c = '';
                        this.recRelationShip.Speciality_Group__c = '';
                        //this.recRelationShip.Originator_2__c = '';
                        this.recRelationShip.Wealth_Rank__c = '';
                        this.recRelationShip.Introduction_Type__c = '';
                        this.dispatchEvent(
                            new ShowToastEvent({
                                title :'Success',
                                message : 'LWC Relationship is created',
                                variant : 'Sucess',
                            }),
                        );

                    }
                    console.log('Check record Details' +JSON.stringify(result));
                    console.log('Check message Details' +this.message);

                })
                .catch(error => {
                    this.message = undefined;
                    this.error = error;
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title :'Error creating the record',
                            message : 'error.body.message',
                            variant : 'error',
                        }),
                    );
                    console.log('Check record Details' +JSON.stringify(error));

                });
          
    }
    
    

}