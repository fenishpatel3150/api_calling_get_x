import 'package:api_calling_get_x/view/SecondScreen/SecondScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ProductController/ProductController.dart';

class HomeScreen extends StatelessWidget {
  RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.rectangle_grid_2x2,
            color: Colors.white,
          ),
        ),
          title: Center(child: Text('Recipes',style: TextStyle(color: Colors.white),)),
          backgroundColor: Color(0xff20232b),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff404654),
      body: Obx(() {
        if (recipeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: recipeController.recipeList.length,
            itemBuilder: (context, index) {
              final recipe = recipeController.recipeList[index];
              return InkWell(
                onTap: ()
                {
                 Get.to(()=> SecondScreen(),arguments: recipe);
                },
                child: ListTile(
                  title: Text(recipe.name,style: TextStyle(color: Colors.white),),
                  subtitle: Text('Rating: ${recipe.rating}',style: TextStyle(color: Colors.grey),),
                  leading: Image.network(recipe.image),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
