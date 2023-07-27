trigger oppTrigger on Opportunity (before insert,after insert,after update, after delete) {
    if(Trigger.isBefore)
    {
        opportunityTriggerHandler ot = new opportunityTriggerHandler();
        ot.duplicateOpportunity(Trigger.New);
    }
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        opportunityTriggerHandler.rollupFunctions(Trigger.New);
        opportunityTriggerHandler.createTask(Trigger.New);
    }
    if(Trigger.isDelete)
    {
        opportunityTriggerHandler.rollupFunctions(Trigger.old);
    }

}