import { LightningElement,api } from 'lwc';
export default class ChildPublicProperties extends LightningElement {
        @api headerLabel ='This header label from child component'

}