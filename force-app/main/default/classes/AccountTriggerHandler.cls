public class AccountTriggerHandler {    
    public static void populateBillingAddress(List<Account> accounts)
    {
        for(Account acc :accounts)
        {
            if(acc.BillingStreet !=null)
            {
                acc.ShippingStreet =  acc.BillingStreet;
            }
           if(acc.BillingCity !=null)
            {
                acc.ShippingCity =  acc.BillingCity;
            }
            if(acc.BillingState !=null)
            {
                acc.ShippingState =  acc.BillingState;
            }
            if(acc.BillingPostalCode !=null)
            {
                acc.ShippingPostalCode =  acc.BillingPostalCode;
            }
            if(acc.BillingCountry !=null)
            {
                acc.ShippingCountry =  acc.BillingCountry;
            }
        }
            
        
    }
    public void updatePhone(List<Account> accntList)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Account acc :accntList)
        {
                accountIds.add(acc.id);            
        }
        System.debug('$$$$Test accountId$$$$ '+accountIds);
        List<Contact> conList =[Select id,phone,accountId from Contact where AccountId=:accountIds];
        System.debug('####TestconList##### '+conList);
        List<Contact> updatecontList = new List<Contact>();
        if(conList.size()>0)
        {
        for(Contact con :conList)
        {
           for(Account accnt :accntList)
            con.phone = accnt.phone;
            updatecontList.add(con);
        }
        if(updatecontList.size() >0)
        {
            update updatecontList;
        }   
        }
    }
    // Trigger to update closedate with today date and stage to closed lost when close date is grater than 30 and stage not equal Closed Won
    public void updateOppStage(List<Account> accntsList)
    {
        DateTime day30 = System.now()-30;       
        
        Set<Id> accountids = new Set<Id>();
        for(Account accnt :accntsList)
        {
            accountids.add(accnt.id);
        }
        List<Opportunity> oopList = [select id,stagename,accountid,CloseDate from opportunity where accountid=:accountids];
         List<Opportunity> updateoppList = new List<Opportunity>();
        System.debug('List of opportunities'+oopList);
        for(Opportunity opp :oopList)
        {
            System.debug('closeddateopp***********' +day30+'test check condition '+(opp.CloseDate>day30));
            if(opp.CloseDate>day30 && opp.stagename != 'Closed Won')
            {
                opp.CloseDate = System.today();
                opp.stagename = 'Closed Lost';
                updateoppList.add(opp);
            }
        }
        if(updateoppList.size() > 0)
        {
            update updateoppList;
        }
            
        
    
    }
    //Create number of contacts which are equal to number which we have entered in Account(Contact_number)
    public void createContacts(List<Account> accountList)
    {
        List<Contact> contList = new List<Contact>();
        Map<Id,Decimal> accMap = new Map<Id,Decimal>();
        for(Account acc : accountList)
        {
            accMap.put(acc.id,acc.Contact_Number__c);
            System.debug('Get accMap Values' +accMap.get(acc.id));
        }
        if(accMap.size() > 0 && accMap!= null)
        {
            System.debug('Get accMap keySet' +accMap.keySet());
            for(Id accntId :accMap.keySet())
            {
                System.debug('Get accMap accntId' +accMap.get(accntId)); 
                for(Integer i=0;i<accMap.get(accntId);i++)
                {
                    Contact con=new Contact();
                    con.AccountId = accntId;
                    con.lastName = 'contact'+i;
                    contList.add(con);
                    
                }
            }
            if(contList.size() > 0)
            {
                //insert contList;
            }
        }
    }
    
    public void sendEmailNotificationt(List<Account> accnts)
    {
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        User uslist =[select id,profile.name,Email from User where profile.name='System Administrator' Limit 1];
        for(Account acc : accnts)
        {
            if(uslist.email!=null)
            {
                OrgWideEmailAddress[] owea = [select Id from OrgWideEmailAddress where Address = 'padmasree.darapuneni@gmail.com'];
                EmailTemplate templateId = [Select id from EmailTemplate where name = 'Account_Email_Template'];
                mail.toAddresses = new String[] {uslist.email};
                //mail.subject = 'Account is Created. Please take necessary action'; 
                //mail.plainTextBody = 'Account is created successfully. Sending email notification to all System Admins';
                mail.setOrgWideEmailAddressId(owea.get(0).Id);
                mail.setTargetObjectId(uslist.id);
                mail.setTemplateId(templateId.id);
                mail.saveAsActivity=false;
                mailList.add(mail);
                
                
                

            }
        }
        if(mailList.size() > 0)
        {
            Messaging.sendEmail(mailList);
        }
    }
}