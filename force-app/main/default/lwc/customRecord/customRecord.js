import { LightningElement, track } from 'lwc';
import getStudentData from '@salesforce/apex/StudentSearchController.getStudentData';

export default class CustomRecordSearch extends LightningElement {
    searchKey;
    @track students;
    get options() {
        return [
            { label: '', value: '' },
            { label: 'EEE', value: 'EEE' },
            { label: 'ECE', value: 'ECE' },
            { label: 'CSE', value: 'CSE' },
            { label: 'IT', value: 'IT' },
            { label: 'Mechanical', value: 'Mechanical' },
            { label: 'Civil', value: 'Civil' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }
    //This Funcation will get the value from Text Input.
    handelSearchKey(event){
        this.searchKey = event.target.value;
        console.log('Display searchKey Value'+this.searchKey);
    }

    //This funcation will fetch the Account Name on basis of searchkey
    SearchAccountHandler(){
        console.log('call search button');
        //call Apex method.
        getStudentData({
        textkey: this.searchKey,
        textPickValue:this.value})
        .then(result => {
                this.students = result;
        })
        .catch( error=>{
            this.students = null;
        });

    }
    cols = [
        {label:'Student Name', fieldName:'Name' , type:'text'} ,        
        {label:'Group', fieldName:'Group__c' , type:'text'}
              
    ]
}