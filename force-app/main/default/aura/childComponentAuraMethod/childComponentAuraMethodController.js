({
	getMessage : function(component, event, helper) {       
        var parameters = event.getParam('arguments');
        var p1 =parameters.contactList;
        alert('Diplay p1 values '+JSON.stringify(p1));
		component.set('v.contactsList',p1);
        alert('display contactsList '+JSON.stringify(component.get('v.contactsList')));
	}
})