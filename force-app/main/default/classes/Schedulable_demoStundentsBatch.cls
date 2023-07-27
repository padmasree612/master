global class Schedulable_demoStundentsBatch implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        demoStundentsBatch dsb = new demoStundentsBatch();
        Database.executeBatch(dsb);
    }
}