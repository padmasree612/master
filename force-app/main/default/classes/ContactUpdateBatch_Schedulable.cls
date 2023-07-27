global class ContactUpdateBatch_Schedulable implements Schedulable {
   global void execute(SchedulableContext sc) {
      ContactUpdateBatch cub = new ContactUpdateBatch ();
      Database.executeBatch(cub);
   }
}