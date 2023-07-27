({
	getStudentDetails : function(component) {
        component.set('v.columns',[
            {label: 'Student Name',fieldName :'Name',type:'text'},
            {label: 'Student Phone',fieldName :'Student_Phone__c',type:'text'}
        ])	
        var action = component.get('c.findStudentDetails');
        alert('get parameter list '+JSON.stringify(action.getParams()));
        action.setCallback(this,function(actionResult)
        {
            var state = action.getState();
            
            if(state === "SUCCESS")
            {             
                component.set("v.studentList",actionResult.getReturnValue());
                alert("Get Student Details "+ component.get('v.studentList'));
            }
                              
        });
       
        $A.enqueueAction(action);
        
	}
})