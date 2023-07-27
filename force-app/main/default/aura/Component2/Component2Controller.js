({
    component2Event : function(cmp, event) { 
        //Get the event message attribute
        var message = event.getParam("message"); 
        alert('message value' +message);
        //Set the handler attributes based on event data 
        cmp.set("v.eventMessage", message + 'Application Event');         
    }
})