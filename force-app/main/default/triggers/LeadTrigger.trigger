trigger LeadTrigger on Lead (after insert) {
     
    for (Lead objLead : Trigger.new) {
        //make webservice callout 
        LeadTriggerHandler.sendLeadInfo(objLead.FirstName, objLead.LastName, objLead.Email);
    }
}