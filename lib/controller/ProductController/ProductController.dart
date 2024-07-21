import 'package:api_calling_get_x/helper/apiService.dart';
import 'package:api_calling_get_x/model/productModel.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var isLoading = true.obs;
  var recipeList = <Recipe>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes() async {

      isLoading(true);
      final recipes = await apiService.fetchData();
      print(recipes);
      if (recipes != null)
      {
        recipeList.assignAll(recipes.recipes);
      }
      print("Error fetching recipes:");
      isLoading(false);
     }
}
