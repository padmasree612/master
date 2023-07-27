({
	callChild : function(component, event, helper) {
		var params = event.getParam('arguments'); 
        var p1 = params.contactList;
        alert('Dipslay p1 '+JSON.stringify(p1));
        component.set('v.contactsDisplay',p1);
        alert('diaplay con values '+component.get('v.contactsDisplay'));
        
        
    }
})