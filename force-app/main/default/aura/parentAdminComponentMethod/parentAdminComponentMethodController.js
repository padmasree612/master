({
    doInit : function(component,event,helper)
    {
        helper.getContactDetails(component);
    },    
	callChildMethod : function(component, event, helper) {
        var childComponent = component.find("childCmp");
        alert('call childComponent '+childComponent);
        var conList = component.get('v.contactsList');
        var messages = childComponent.callChildMessage(conList);
        alert('Diplay messages '+JSON.stringify(messages));
        //component.set('v.contactsList',messages);       
		
	}
    
})