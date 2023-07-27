({
	getPatientDetails : function(component) {
        alert('values patient details');
        component.set('v.columns',[
            {label:'Patient Name',fieldName : 'Name',type:'text'},
            {label:'Term Fee',fieldName : 'Term1_Fee__c',type:'text'},
            {label:'Patient Brach',fieldName : 'Patient_Branch__c',type:'text'}     
            
            
        ])
        var action = component.get('c.getPatientDetails');
        action.setParams({});
        action.setCallback(this,function(actionResult)
        {
            var state = action.getState();
            if(state ==='SUCCESS')
            {
                component.set('v.patientList',actionResult.getReturnValue());
            }
                               
        });
        $A.enqueueAction(action);
		
	}
})