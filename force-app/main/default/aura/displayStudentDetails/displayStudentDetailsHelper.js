({
	getStudentDetails : function(component) {
        component.set("v.columns",[
            {label:"Student Name",fieldName:'Name',type:'text'},
            {label:"Term Fee",fieldName:'Student_Term_Fee1__c',type:'text'},
            {label:"Student Branch",fieldName:'Student_Branch__c',type:'text'}
        ])
        var action = component.get('c.getStudentDetails');
        action.setParams({});
        action.setCallback(this,function(actionResult)
              {
					var state = action.getState();
                   if(state === "SUCCESS")
                   {
                       component.set("v.studentList",actionResult.getReturnValue());
                   }
              });
        $A.enqueueAction(action);
		
	}
})