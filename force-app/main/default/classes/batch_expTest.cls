@isTest
public class batch_expTest
{

     @testSetup

    static void batch_expInsert()
    {
        Test.startTest();
    List<Account> accntList = new List<Account>();
        for(Integer i =0;i<2;i++)
        {
            Account acc = new Account();
            acc.Name ='TestAccountName'+i;
            accntList.add(acc);
        }
        insert accntList;        
        
     Id jobId = System.enqueueJob(new AccountQueueableExample(accntList)); 
     scheduled_Exp myClass = new scheduled_Exp ();   
         String chron = '0 0 23 * * ?';        
         system.schedule('Test Sched', chron, myClass);

             Test.stopTest();   
    
    }
    @isTest
    static void batch_expInsert1()
    {
      
     Test.startTest();
     
     batch_exp be = new batch_exp();
     Database.executeBatch(be);
     
     
          
      Test.stopTest();
      }
 }