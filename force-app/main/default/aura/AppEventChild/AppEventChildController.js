({
	doInit : function(component, event, helper) {	
        helper.getContactDetails(component);
	},
    disconlist :function(component, event, helper){	
        var appEvent = $A.get('e.c:AppEvent');
        var consList =component.get('v.conlist');
        appEvent.setParams({
            "contactList" :consList
        })
        appEvent.fire();
    }
})