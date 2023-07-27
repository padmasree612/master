import { LightningElement,track } from 'lwc';
import studName from '@salesforce/schema/Student__c.Name';
import stdId from '@salesforce/schema/Student__c.Id';
import studRollNumber from '@salesforce/schema/Student__c.Student_Roll_Number__c';
import saveStudent from '@salesforce/apex/createStudentController.saveStudent';
import getStudentDetails from '@salesforce/apex/createStudentController.getStudentDetails';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'; 
export default class CreateStudentRecord extends LightningElement {
    @track students
    @track recStdId;
    @track getStudentRecord = {
        Student_Roll_Number__c : studRollNumber,
        Name: studName,
        Id : ''

    }

    nameInpChange(event)
    {
        this.getStudentRecord.Name = event.target.value;
        
    }
    rollInpChange(event)
    {
        this.getStudentRecord.Student_Roll_Number__c = event.target.value;
    }
    createStudRec(){
        alert('test createStud' +JSON.stringify(this.getStudentRecord));
        saveStudent({studs : this.getStudentRecord })                    
        .then(result =>{
            this.getStudentRecord={};
            const toastEvent = new ShowToastEvent({
                title:'Success!',
                message:'Student created successfully',
                variant:'success'
                });
                this.dispatchEvent(toastEvent);
                })
                .catch(error=>{
                this.error=error.message;
                window.console.log(this.error);
                });
                

    }
    nextStudRec()
    {
        //alert('check nextStudrec');
        getStudentDetails({stdRoll : this.getStudentRecord.Student_Roll_Number__c })
        .then(result =>{
           this.students = result; 
           alert('Result Data '+result);
           if(result != null) 
           {
            this.getStudentRecord.Student_Roll_Number__c =result.Student_Roll_Number__c;
            this.getStudentRecord.Name =result.Name;           
            this.getStudentRecord.Id = result.Id;
            console.log('thisstudents' +JSON.stringify(this.students));
           }
           else{
                this.getStudentRecord.Name ='';
           }
        })
        .catch(error=>{
            this.error=error.message;
            window.console.log('Padma '+this.error);
            });
            
    }



}