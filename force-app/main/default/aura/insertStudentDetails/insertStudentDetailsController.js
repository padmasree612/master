({
	insertStudentRecord : function(component, event, helper) {
        var students = component.get("v.student");
        alert('Students Display '+JSON.stringify(students));
        var action = component.get("c.createStudent");
        alert('Check std values before setparams '+JSON.stringify(action.getParams('std')));
        action.setParams({
            "std" : students
        });
       alert('Check std values after setparams '+JSON.stringify(action.getParams('std')));
        action.setCallback(this,function(result)
        {
           var state = action.getState(); 
           if(state === "SUCCESS")
           {
               var name = result.getReturnValue();
               alert('Check std values after setparams '+JSON.stringify(name));
           }
           
        });
        $A.enqueueAction(action);
		
	}
})