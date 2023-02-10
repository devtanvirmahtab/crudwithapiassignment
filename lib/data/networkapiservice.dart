import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utiles/utilels.dart';


class NetworkApiService{

  Future getGetApiResponse(String url) async{
    try{
      final response = await http.get(Uri.parse(url),
          headers: {
            // "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          }
      ).timeout(Duration(seconds: 50));
      if(response.statusCode==200){
        return jsonDecode(response.body);
      } else{
        print('Request Failed');
      }
    }catch(e){
      // Utiles.toastMessage("$e");
      print("$e");
    }
  }

  Future gePostApiResponse(String url,dynamic data) async{
    try{
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },

      ).timeout(Duration(seconds: 50));
      if(response.statusCode==200){
        return jsonDecode(response.body);
      } else{
        print('Request Failed');
      }
    }catch(e){
      // Utiles.toastMessage("$e");
      print("$e");
    }
  }
}