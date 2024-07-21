import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_calling_get_x/model/productModel.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final Recipe recipe = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()
          {
              Get.back();
          },
          child: Icon(CupertinoIcons.back,color: Colors.white,),
        ),
        title: Text(recipe.name,style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff20232b),
      ),

      backgroundColor: Color(0xff404654),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(recipe.image,fit: BoxFit.cover,)),
              SizedBox(height: 16),
              Text(
                recipe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Rating: ${recipe.rating}',style: TextStyle(color: Colors.white70)),
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.star_fill,color: Colors.yellow,size: 15,)
                ],
              ),
              SizedBox(height: 8),
              Text('Prep Time: ${recipe.prepTimeMinutes} minutes',style: TextStyle(color: Colors.white70),),
              SizedBox(height: 8),
              Text('Cook Time: ${recipe.cookTimeMinutes} minutes',style: TextStyle(color: Colors.white70)),
              SizedBox(height: 16),
              Text('Ingredients', style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('${recipe.ingredients}',style: TextStyle(color: Colors.white70)),
              SizedBox(height: 16),
              Text('Instructions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 8),
              Text('${recipe.instructions}',style: TextStyle(color: Colors.white70))
            ],
          ),
        ),
      ),
    );
  }
}
