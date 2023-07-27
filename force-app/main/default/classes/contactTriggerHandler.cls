public class contactTriggerHandler {
    //Trigger to implement Rollup Summary using Lookup Relationship
   
    public static void insertContact_List(List<Contact> conList)
    {
        List<Account> accntList = new List<Account>();
        Set<Id> accountIds = new Set<Id>();
       
        for(Contact con : conList)
        {
            accountIds.add(con.AccountId);
        }
        List<Account> accountList = [select id,name,NumberofLocations__c,(select id from contacts) from Account where id=:accountIds];
        System.debug('Size of accountList' +accountList);
            for(Account acc :accountList)
        {
            System.debug('Contacts size'+acc.contacts.size());
            acc.NumberofLocations__c = acc.contacts.size();
            accntList.add(acc);            
        }
        if(accntList.size() > 0)
        {
            update accntList;
        }
    
    }
    public void avoidDuplicatesonAccount(List<Contact> conList){
        
        Map<Id,List<Contact>> accMap = new Map<Id,List<Contact>>();
        List<Contact> contactList;        
        List<Contact> contactsList = [select id,lastname,email,AccountId from Contact];
        system.debug('@@@@TestcontactsList@@@@@' +contactsList);
        for(Contact c:contactsList)
        {
            system.debug('@@@@AccountId Exists@@@@' +accMap.containsKey(c.AccountId));
            if(accMap.containsKey(c.AccountId))
            {
                accMap.get(c.AccountId).add(c);
            }
            else
            {
                contactList = new List<Contact>();
                contactList.add(c);
                System.debug('@@@Checking Contact Information@@@@@' +contactList);
                accMap.put(c.AccountId,contactList);
                System.debug('@@@Checking Account  Information@@@@@' +accMap.get(c.AccountId));
            }
            for(Contact con:conList)
            {
                if(accMap.containsKey(con.AccountId))
                {
                    System.debug('@@@@@@@@@@Testing for New Records@@@@'+accMap.get(con.AccountId));
                    for(Contact cons : accMap.get(con.AccountId))
                    {
                        System.debug('Check emails'+con.email+'check old email'+cons.email);
                        if((con.email == cons.email))
                        {
                           System.debug('Inside if condition');
                            con.email.addError('Email already exists for the particular account');
                            }
                    }
                }
            }
        }
        
    
    } 
    public static void findSumofAmounts(List<Contact> conList){
        
        Set<Id> accountIds = new Set<Id>();
        for(Contact c:conList)
        {
           accountIds.add(c.AccountId); 
        }
        List<Account> updateAccountList = new List<Account>();
        List<Account> accountList =[select id,Total_Amount__c,(select id,Amount__c from Contacts) from Account where Id=:accountIds];
        for(Account acc : accountList)
        {
            Double totalAmount = 0.0;
            for(Contact con :acc.Contacts)
            {
                if(con.Amount__c !=null)
                {
                    System.debug('Test total Amount' +totalAmount);
                    totalAmount+=con.Amount__c; 
                    System.debug('After assingning Test total Amount' +totalAmount);
                }
                
            }
            acc.Total_Amount__c = totalAmount;
            updateAccountList.add(acc);
        }
        update updateAccountList;
        }
    
     
    
}