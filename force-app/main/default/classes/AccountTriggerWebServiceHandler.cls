public class AccountTriggerWebServiceHandler
{
    //@future(callout=true)
    public static void sendAccountInfo(String accName, String accPhone)
    {
        try
        {
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
            
            
            request.setEndPoint('https://www.facebook.com');
            request.setHeader('Content-Type','application/json');
            request.setMethod('POST');
            request.setBody('acName='+EncodingUtil.urlEncode(accName,'UTF-8')+'&acPhone='+EncodingUtil.urlEncode(accName,'UTF-8'));
            response = http.send(request);
            System.debug('Status Code ' +response.getStatusCode());
            if(response.getStatusCode() ==200)
            {
                System.debug('Response '+response.getBody());
            }
            }
            catch(System.CalloutException e)
            {
                System.debug('Error '+e.getMessage());
            
            }
            
        
    }
            
        
    }