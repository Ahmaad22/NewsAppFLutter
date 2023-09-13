import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/atrticle.dart';

class ApiModel{
  final Dio dio;
  ApiModel(this.dio);

String? category;
 Future<List<ArticleModel>> getNews({required category})async{

  Response response = await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=a26f179605c7464596802df3c0f19493&category=$category");
Map<String,dynamic> JsonData = response.data;
List<ArticleModel>atrticleList=[];
for (var article in JsonData['articles']) {
      ArticleModel articleModel = ArticleModel(
        image: article['urlToImage'],
        title: article['title'],
       discription:  article['description'],
      );

      atrticleList.add(articleModel);
    }

    return atrticleList;
}
}