import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../domain/entities/article_entity.dart';

final articleServiceProvider = Provider((ref){

  return ApiService();
});

//SOLID - Single Responsibility Principle
// This classes sole purpose is to get the articles from an api endpoint
class ApiService {

  final endPointUrl =
      Uri.parse("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1e5248923a104b30b4920c8787a6f2d2");

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}