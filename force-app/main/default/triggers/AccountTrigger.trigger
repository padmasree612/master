trigger AccountTrigger on Account (after insert) {
    for(Account acc : Trigger.New)
    {
        AccountTriggerWebServiceHandler.sendAccountInfo(acc.Name,acc.Phone);
    }
    
}