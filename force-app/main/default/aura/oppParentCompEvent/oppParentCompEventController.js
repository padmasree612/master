({
	handleEvent : function(component, event, helper) {
        var response = event.getParam('oppList');
        component.set('v.dispOpp',response);
        alert('dispOpp '+component.get('v.dispOpp'));
		
	}
})