({
    doInit: function(component, event, helper) {
        helper.getContactDetails(component);
    },
	displayContacts : function(component, event, helper) {
        var childComponent = component.find('childCmp');        
        alert('childComponent '+childComponent);
		var cons = component.get("v.conList");      
        var messages = childComponent.callChildMessage(cons);        
    		
    }	
})