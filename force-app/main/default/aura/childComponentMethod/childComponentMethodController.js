({
addNumbers : function(component, event, helper) {
       var params = event.getParam('arguments');
       var num1 = params.number1;
       var num2 = params.number2;
    
    return num1+num2;
}
})