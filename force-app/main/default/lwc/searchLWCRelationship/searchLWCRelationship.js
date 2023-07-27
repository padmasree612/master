import { LightningElement,wire,track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import RELATIONSHIP_OBJECT from '@salesforce/schema/LWC_Relationship__c';
import NAME_FIELD from '@salesforce/schema/LWC_Relationship__c.Name';
import CRM_FIELD from '@salesforce/schema/LWC_Relationship__c.CRM_Role__c';
import getRelationshipData from '@salesforce/apex/searchLWCRelationshipController.getRelationshipData';
export default class SearchLWCRelationship extends LightningElement {
   searchKey;

   @track relationships;
   @track name = NAME_FIELD;
   @track crmrole = CRM_FIELD;

    recRelationShip = {
        Name : this.name,
        CRM_Role__c : this.CRM_FIELD
    }

    @wire(getObjectInfo, { objectApiName: RELATIONSHIP_OBJECT})
    objectInfo

    @wire(getPicklistValues, {recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: CRM_FIELD})
    crmPicklistValues;
    handleSearchKey(event)
    {
         this.searchKey = event.target.value;
         console.log('Display searchKey Value ' +this.searchKey )

    }
    handleCrmChange(event){
        this.recRelationShip.CRM_Role__c = event.detail.value;
        console.log('Display crm values '+this.recRelationShip.CRM_Role__c);
    }
    searchRelRec()
    {
        console.log('search key');
        getRelationshipData({
            textkey :  this.searchKey, 
            textPickValue : this.recRelationShip.CRM_Role__c
            

        })        
        .then(result =>
            {
                this.relationships = result;
                console.log('Test textkeys' +this.relationships);
            })
            .catch(error =>
            {
                this.relationships = null;
                console.log('Test failed textkeys' +this.relationships);
            })         

            
    }
    cols =[{
        label :'Relationship Name',fieldName : 'Name', type:'text'},
        {label :'CRM Role', fieldName : 'CRM_Role__c',type:'text'}]

}