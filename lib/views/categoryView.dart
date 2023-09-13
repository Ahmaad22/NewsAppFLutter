import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/atrticle.dart';
import 'package:news_app_ui_setup/widgets/newsPost.dart';

import '../services/ApiModel.dart';

class categoryView extends StatefulWidget {
  final String category;

  const categoryView({Key? key, required this.category}) : super(key: key);

  @override
  State<categoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<categoryView> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = ApiModel(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: Padding(
  padding: const EdgeInsets.only(left: 16, right: 16),
  child: CustomScrollView(
    slivers: [
      FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(child: Center(child: Text("Oops, there's an error. Please try again.")));
          } else if (snapshot.hasData) {
            final articles = snapshot.data!;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return newsPost(articleModel: articles[index]);
                },
                childCount: articles.length,
              ),
            );
          } else {
            return SliverToBoxAdapter(child: Center(child: Text("No data available.")));
          }
        },
      ),
    ],
  ),
)




    );
  }
}
