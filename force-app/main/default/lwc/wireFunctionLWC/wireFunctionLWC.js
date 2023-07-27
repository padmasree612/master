import { LightningElement,wire,api,track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHelperLWC.getAccountList';
export default class WireFunctionLWC extends LightningElement {    
    @track accounts;
    @track error;
    @wire(getAccountList)
    wiredAccounts({data,error}){
    if(data)
    {
        this.accounts=data;
    }
    else if(error){
        this.error = error;
    }
    
}

}