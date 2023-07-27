({
    executeMyMethod : function (component, event, helper) {
        var params = event.getParam('arguments');
        alert('Display params '+JSON.stringify(params));
        console.log('Param 1: '+ params.param1);
        console.log('Param 2: '+ params.param2);
    }
})