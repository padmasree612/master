({
	insertPatientRecords : function(component, event, helper) {
        var patients = component.get("v.patient");
        alert('Display pat value '+JSON.stringify(patients));
        var action = component.get('c.createPatient');
        
        action.setParams({
            "pat" : patients
        });
        alert('get Parms' +JSON.stringify((action.getParams())));
        action.setCallback(this,function(result){
            var state = action.getState();
            alert(state);
             if(state === "SUCCESS")
        {
            var name = action.getReturnValue();
            alert('Success Return Values '+JSON.stringify(name));
        }
        else
        {
            alert('Failed');
        }
        });
         $A.enqueueAction(action);
    }       
})