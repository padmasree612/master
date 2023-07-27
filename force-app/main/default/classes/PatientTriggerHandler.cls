public class PatientTriggerHandler
{

    public void findNoofPatients(List<Patient__c> patientList)
    {
        Set<Id> patientIds = new Set<Id>();
        if(RecursiveTriggerHandler.isFirstTime){
        RecursiveTriggerHandler.isFirstTime = false;
         for(Patient__c pat : patientList)
         {
               patientIds.add(pat.Hospital__c);
         }
         
        List<Hospital__c> hspList =[select id,No_of_Patients__c,(select id from Patients__r) from Hospital__c where id=:patientIds];
        System.debug('Dispaly hospitalList '+hspList);
        List<Hospital__c> updateHospitalList = new List<Hospital__c>();
        for(Hospital__c hsp : hspList)
        {
              System.debug('Dispaly hsp values '+hsp.Patients__r.size());
              hsp.No_of_Patients__c = hsp.Patients__r.size();
              updateHospitalList.add(hsp);
         } 
    
        if(updateHospitalList.size()>0)
        {
            update updateHospitalList;
        }
        
        
        }
       } 
       
       public void updateBranch(List<Patient__c> patientList)
       {
            Set<Id> patientIds = new Set<Id>();
            for(Patient__c pat : patientList)
            {
                patientIds.add(pat.Hospital__c);
            }
            List<Hospital__c> hspList = [select id, Hospital_Branch__c,(select id,Patient_Branch__c from Patients__r) from Hospital__c where id=:patientIds];
            List<Hospital__c> hospList = new List<Hospital__c>();
            if(hspList.size() > 0)
            {
                for(Hospital__c hsp : hspList)
                {
                    for(Patient__c patients : patientList)
                    {
                        hsp.Hospital_Branch__c = patients.Patient_Branch__c;
                        hospList.add(hsp);
                    }
                }
                    update hospList;
            }
       }
       
       public static void findtotalFee (List<Patient__c> patientList)
       {
            Set<Id> patientIds = new Set<Id>();
            for(Patient__c pat : patientList)
            {            
                patientIds.add(pat.Hospital__c);
            
            } 
            List<Hospital__c> hspList =[select id,No_of_Patients__c,Total_Patients_Term_fee__c,(select id,Term1_Fee__c from Patients__r) from Hospital__c where id=:patientIds];
            List<Hospital__c> updateHospitalList = new List<Hospital__c>();
            Decimal totalAmount = 0.0;
            for(Hospital__c hsp : hspList)
            {
               System.debug('Dispaly hsp values '+hsp);
               for(Patient__c pa : hsp.Patients__r)
               {
                   System.debug('Dispaly pa values '+pa.Term1_Fee__c);
                    if(pa.Term1_Fee__c!=null)
                    {
                        System.debug('Dispaly before totalAmount '+totalAmount);
                        totalAmount+=pa.Term1_Fee__c;
                        System.debug('Dispaly after totalAmount '+totalAmount);
                    }
               }
            hsp.Total_Patients_Term_fee__c =totalAmount;
            updateHospitalList.add(hsp);
            }
                if(updateHospitalList.size()>0)
                {
                    update updateHospitalList;
                }
       }   
       
    }