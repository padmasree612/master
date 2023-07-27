({
    searchKeyChange : function(cmp, event) {
        // Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = cmp.getEvent("cmpEvent"); 
        alert('Check the cmpEvent Result' +JSON.stringify(cmpEvent));
        cmpEvent.setParams({"searchKey": event.target.value});        
        var testResult = cmpEvent.getParams("searchKey")
        alert('Check the setParams Result'+JSON.stringify(testResult));
        cmpEvent.fire();
    }
}
)