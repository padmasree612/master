public class LeadTriggerHandler {
     
    @future (callout=true)
    public static void sendLeadInfo(string firstName, string lastName, string email) {
        try{
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
             
            request.setEndpoint('https://www.facebook.com');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('POST');
            request.setBody('fname='+EncodingUtil.urlEncode(firstName, 'UTF-8')+'&lname='+EncodingUtil.urlEncode(lastName, 'UTF-8')
                            +'&email='+EncodingUtil.urlEncode(email, 'UTF-8'));
            request.setCompressed(true);
             
            response = http.send(request);
            
            if (response.getStatusCode() == 200) {

                System.debug('Response-' + response.getBody());
            }
        }
        catch(System.CalloutException e){
            System.debug('Error-' + e.getMessage());   
        }
    }
}