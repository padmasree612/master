({
	executemyMethod : function(component, event, helper) {
        alert('call child js');
        var params = event.getParam('arguments');
        console.log('Param 1 '+params.param1);
        console.log('Param 2 '+params.param2);
		
	}
})