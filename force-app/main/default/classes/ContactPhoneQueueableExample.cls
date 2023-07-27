public class ContactPhoneQueueableExample implements Queueable {
    public List<Contact> conList ; 
    public ContactPhoneQueueableExample(List<Contact> conList){
        this.conList = conList ;  
    }
    public void execute(QueueableContext context) {
        for(Contact con :conList){
            // Update the Account Name 
            con.Phone = '9704781094';
        }
        update conList;
    }
}