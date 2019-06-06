import 'dart:io';
import 'dart:convert';


class DogModel{
  String name;
  String location;
  String description;
  String imageUri;
  
  int rating =10;
  
  
  DogModel({this.name,this.location,this.description});
  
  HttpClient client=HttpClient();
  // This is how http calls are done in flutter:
  Future getImageUrl() async{

    if (imageUri!=null){
      return;
    }
    try{
      // Use darts Uri builder
      var uri=Uri.https("dog.ceo", "/api/breeds/image/random");
      var request= await client.getUrl(uri);
      var response= await request.close();
      var responseBody=await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageUri=json.decode(responseBody)['message'];
    }catch(exception){
      print(exception);
    }
  }
}