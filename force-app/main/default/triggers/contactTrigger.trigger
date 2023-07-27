trigger contactTrigger on Contact (before insert,before update,after insert,after update,after delete) {
 
  if(RecursiveTriggerHandler.isFirstTime){
        RecursiveTriggerHandler.isFirstTime = false;
    if(Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate))
    {
    contactTriggerHandler cth = new contactTriggerHandler();
    cth.avoidDuplicatesonAccount(Trigger.new);
    }
    if((Trigger.isInsert || Trigger.isUpdate))
    {
        contactTriggerHandler.insertContact_List(Trigger.new);
        contactTriggerHandler.findSumofAmounts(Trigger.new);
        
    }
    if(Trigger.isDelete)
    {
        contactTriggerHandler.insertContact_List(Trigger.old);
        contactTriggerHandler.findSumofAmounts(Trigger.old);
    }
  }  

}