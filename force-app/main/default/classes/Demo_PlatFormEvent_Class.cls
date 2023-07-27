public class Demo_PlatFormEvent_Class
{
<<<<<<< HEAD

=======
>>>>>>> 33cfbdb (initial commit)
    public void publishEVENT(Id AccountId)
    {
        Account accntObj = [Select Id,CustomerPriority__c from Account where Id=:AccountId];
        accntObj.CustomerPriority__c = 'High';
        update accntObj;
<<<<<<< HEAD
        
        platform_events__e eventObj = new platform_events__e(Account_Id__c = AccountId);
=======
       
        Demo_Event__e   eventObj = new Demo_Event__e(Account_Id__c = AccountId);
>>>>>>> 33cfbdb (initial commit)
        Database.saveResult sr =  EventBus.publish(eventObj);
        if(sr.isSuccess())
        {
            System.debug('event subscribed successfully');
        }
<<<<<<< HEAD
        
=======
>>>>>>> 33cfbdb (initial commit)
        else
        {
            System.debug('error subscribed successfully');
        }
<<<<<<< HEAD
      
=======
>>>>>>> 33cfbdb (initial commit)
    }
}