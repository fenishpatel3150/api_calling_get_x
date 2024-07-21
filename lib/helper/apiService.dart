import 'dart:convert';
import 'package:api_calling_get_x/model/productModel.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;

class ApiService {

  Future<RecipeModel> fetchData() async {

    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      return RecipeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load recipes');
    }
  }


}
