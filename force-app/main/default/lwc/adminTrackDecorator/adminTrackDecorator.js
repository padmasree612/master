import { LightningElement,track} from 'lwc';
export default class AdminTrackDecorator extends LightningElement {
    @track greeting = 'Hello World'; 
    handleChangeEvent(event)
    {
       this.greeting = event.target.value;
    }
}