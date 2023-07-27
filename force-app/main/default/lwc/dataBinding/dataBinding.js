import { LightningElement, track,api } from 'lwc';
export default class DataBinding extends LightningElement {
    fullname ="Salesforce LWC Learning"     
      
    changeHandler(event)
    {
      this.fullname = event.target.value
    }

   @track address ={
      city:"Hyderabad",
      postCode:"1234",
      country:"India"
    }
    trackHandler(event)
    {
        this.address.city =event.target.value

    }
  }