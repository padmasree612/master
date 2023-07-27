({
    component1Event : function(cmp, event,helper) { 
        //Get the event using event name. 
        var appEvent = $A.get("e.c:SampleApplicationEvent"); 
        alert('Check appEvent Details' +JSON.stringify(appEvent));
        //Set event attribute value
        appEvent.setParams({"message" : "Demo"});        
        appEvent.fire(); 
        alert('Check appEvent Details_Message' +JSON.stringify(appEvent.getParams(appEvent)));
    }
})