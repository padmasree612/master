({
   deleteAccount: function(component, event, helper) {
       
         component.find("deleteAccount").deleteRecord($A.getCallback(function(saveResult) {
            
           // Handling state of response(SUCCESS,INCOMPLETE,ERROR)
           
             if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                alert("Account deleted successfully.");
            }
            else if (saveResult.state === "INCOMPLETE" ) {
                alert("Error in deleting record");
            }
            else if (saveResult.state === "ERROR") {
               alert("Problem deleting record, error:" + 
                           JSON.stringify(saveResult.error));
            }
            else
            {
                 alert('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
            
         }));
            
            
            
        
    }

})