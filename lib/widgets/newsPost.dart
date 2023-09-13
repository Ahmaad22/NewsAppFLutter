import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/atrticle.dart';

class newsPost extends StatelessWidget {
  const newsPost({required this.articleModel,super.key});
final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
       ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: articleModel.image != null
      ? Image.network(
          articleModel.image!,
          width: double.infinity,
          fit: BoxFit.fill,
          height: 200,
        )
      : Placeholder( // Use a Placeholder widget or any other widget you prefer
          fallbackHeight: 200,
          fallbackWidth: double.infinity,
        ),
),

        SizedBox(height: 8,),
        Text(articleModel.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
        )
        ,SizedBox(height: 8,),
          Text(articleModel.discription ?? " ",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),
        )
           ,  SizedBox(height: 16,),
      ],
    );
  }
}