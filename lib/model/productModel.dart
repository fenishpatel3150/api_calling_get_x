class RecipeModel {
  final List<Recipe> recipes;
  final int total;
  final int skip;
  final int limit;

  RecipeModel({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      recipes: List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(x))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Recipe {
   int id;
   String name;
   List<String> ingredients;
   List<String> instructions;
   int prepTimeMinutes;
   int cookTimeMinutes;
   int servings;
   String cuisine;
   int caloriesPerServing;
   List<String> tags;
   int userId;
   String image;
   double rating;
   int reviewCount;
   List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }
}


