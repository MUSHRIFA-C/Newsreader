import 'dart:convert';
import 'package:newsreader/model/article_model.dart';
import 'package:http/http.dart' as http;



class Apiservice{
  Future<List<Articles>> getArticle() async{
    final url = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=5c1480f3b4bb49acb173add4caef7979';

    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var body=json.decode(response.body);

      List<Articles> _data=List<Articles>.from(
          body['articles'].map((e) => Articles.fromJson(e)).toList());
      return _data;
    }
    else{
      List<Articles> _data = [];
      return _data;
    }

  }
}