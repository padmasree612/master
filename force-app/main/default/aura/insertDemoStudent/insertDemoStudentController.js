({
	insertStudentDetails : function(component, event, helper) {
        var studentList = component.get("v.students");
        alert('Display studentList '+JSON.stringify(studentList));
        var action = component.get('c.insertStudent');
		alert('Display std Details '+JSON.stringify(action.getParam('std')));        
        action.setParams({
            "std" : studentList
        });
        alert('Display after std Details '+JSON.stringify(action.getParam('std')));
        action.setCallback(this,function(result){
            var state =  action.getState();  
            alert('Display state '+state);
            if(state === "SUCCESS")
            {
               alert('Display return Value List '+JSON.stringify(result.getReturnValue()));
                var name= result.getReturnValue();
                alert('Display studentName List '+JSON.stringify(name));
            }
        else
        {
            alert('Failed');
        }
        });
        $A.enqueueAction(action);
    }
})