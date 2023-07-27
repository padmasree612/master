public class ContactEmailQueueableExample implements Queueable {
    public List<Contact> conList ; 
    public ContactEmailQueueableExample(List<Contact> conList){
        this.conList = conList ;  
    }
    public void execute(QueueableContext context) {
        for(Contact con :conList){
            // Update the Account Name 
            con.Email = '';
        }
        //update conList;
    }
}