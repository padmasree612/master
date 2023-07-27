global class scheduled_demoStundentBatch implements Schedulable {
    global void execute(SchedulableContext sc)
    {
         demoStundentBatch dsb = new demoStundentBatch();
            Database.executeBatch(dsb);
    }
}