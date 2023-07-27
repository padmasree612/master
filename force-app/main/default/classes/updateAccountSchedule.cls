public class updateAccountSchedule implements Schedulable
{
    public void execute(SchedulableContext SC)
    {
        updateAccount upa = new updateAccount();
        Database.executeBatch(upa);
    }
}