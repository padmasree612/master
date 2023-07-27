public class AccountQueueableExample implements Queueable {
    public List<Account> accList ; 
    public AccountQueueableExample(List<Account> accList){
        this.accList = accList ; 
        System.debug('@@@@@@Display accountList@@@@@@@@' +this.accList);
    }
    public void execute(QueueableContext context) {
        for(Account acc :accList){
            // Update the Account Name 
            acc.Name = acc.Name + 'sfdcpoint';           
        }
        update accList;
    }
}