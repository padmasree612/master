({
	handleChildMethod : function(component, event, helper) {
        var response = event.getParam('contactList');
        component.set('v.displayContacts',response);
		
	}
})