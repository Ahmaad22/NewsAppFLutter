import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/categoryModel.dart';
import 'package:news_app_ui_setup/views/categoryView.dart';

class categoryWidget extends StatelessWidget {
    categoryWidget({super.key,required this.catObject,required this.category});
  final CategoryModel catObject;
String category;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return  categoryView(category: catObject.title,);
  }));
},

      child: Padding(
        padding: const EdgeInsets.only(right:10.0),
        child: Container(
            width: 150,
            height: 100,
           
            decoration: BoxDecoration(
      
          image:  DecorationImage(image: AssetImage(catObject.image),
          fit: BoxFit.fill
          ),
              borderRadius: BorderRadius.circular(10),
      
            
            
            ),
               child:  Center(child: 
             Text(
              catObject.title
               
              , style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
         ),
      ),
    );
  }
}