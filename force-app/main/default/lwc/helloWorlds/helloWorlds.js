import { LightningElement } from 'lwc';

export default class HelloWorlds extends LightningElement {
greeting='World';
changeHandler(event)
{
   this.greeting = event.target.value;
}
}