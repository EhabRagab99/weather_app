import 'dart:convert';

class DecodeApiKey{

 String decodeApiKey({required String apiKey,required String key}){
   Codec<String, String> stringToBase64 = utf8.fuse(base64);
   String apiKeyDecoded = stringToBase64.decode(apiKey);
   String keyDecoded = stringToBase64.decode(key);
   String flag= apiKeyDecoded[apiKeyDecoded.length - 1];
   apiKeyDecoded= apiKeyDecoded.substring(0, apiKeyDecoded.length-1,);
   if(flag=='0'){
    apiKeyDecoded= apiKeyDecoded.substring(keyDecoded.length,apiKeyDecoded.length );
   }
   else if(flag=='1'){
     apiKeyDecoded= apiKeyDecoded.substring(0,apiKeyDecoded.length-keyDecoded.length );
   }
      return apiKeyDecoded;
 }
}
