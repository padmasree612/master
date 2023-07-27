public class ContactQueueableExample implements Queueable {
    public List<Contact> conList ; 
    public ContactQueueableExample(List<Contact> conList){
        this.conList = conList ;  
    }
    public void execute(QueueableContext context) {
        for(Contact con :conList){
            // Update the Account Name 
            con.LastName = con.LastName + '';
        }
        update conList;
        Id jobId = System.enqueueJob(new ContactPhoneQueueableExample(conList));

    }
}