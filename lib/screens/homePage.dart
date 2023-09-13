import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/atrticle.dart';
import 'package:news_app_ui_setup/models/categoryModel.dart';
import 'package:news_app_ui_setup/services/ApiModel.dart';
import 'package:news_app_ui_setup/widgets/categorywidget.dart';
import 'package:news_app_ui_setup/widgets/newsPost.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  
  

  @override
  State<homePage> createState() => _homePageState();
}
   bool isLoading = true;

 var future;
class _homePageState extends State<homePage> {
@override
  void initState() {
    // TODO: implement initState
future = ApiModel(Dio()).getNews(category: "general");
    super.initState();
  }







 final List<CategoryModel> categoryList =const[


  CategoryModel(image: 'assets/health.avif', title: 'Health'),
  CategoryModel(image: 'assets/sports.jpeg', title: "Sports"),
  CategoryModel(image: 'assets/technology.jpeg', title: "Technology"),
  CategoryModel(image: 'assets/business.jpeg', title: "Business"),
  CategoryModel(image: 'assets/science.avif', title: "Science"),
  CategoryModel(image: 'assets/entertaiment.avif', title: "Entertainment"),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
            Text("Cloud",style: TextStyle(color: Colors.orange,fontSize: 16,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return categoryWidget(catObject: categoryList[index],category: 'general',);
          },
        ),
      ),
    ),
    SliverToBoxAdapter(child: SizedBox(height: 15)),
NewsShow()
  ],
  
  )));}
  
  
  
  }

class NewsShow extends StatelessWidget {
  const NewsShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     FutureBuilder<List<ArticleModel>>(
      future: future, // Assuming future is initialized correctly
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Text("Oops, there's an error. Please try again."));
        } else if (snapshot.hasData) {
          final articles = snapshot.data!;
    
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return newsPost(
                  articleModel: articles[index],
                );
              },
              childCount: articles.length,
            ),
          );
        } else {
          return SliverToBoxAdapter(child: Text("No data available."));
        }
      },
    );
  }
}

