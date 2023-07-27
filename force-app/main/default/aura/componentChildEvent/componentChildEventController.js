({
	doInit : function(component, event, helper) {	
        helper.getContactDetails(component);
	},
    disconlist :function(component, event, helper){	
        var compEvent = component.getEvent('compEvent');
        var consList =component.get('v.conlist');
        compEvent.setParams({
            "contactList" :consList
        })
        compEvent.fire();
    }
})