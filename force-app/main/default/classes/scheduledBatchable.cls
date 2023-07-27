global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      Opportunity_Demo b = new Opportunity_Demo(); 
      database.executebatch(b);
   }
}