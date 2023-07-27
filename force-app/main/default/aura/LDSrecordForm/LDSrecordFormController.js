({
	handleSubmit : function(component, event, helper) {
        component.find('notifLib').showToast({
            "variant" :"Success",
            "title" : "Student Created",
            "message" : "Record ID:" +event.getParam("id")
        });
		
	}
})