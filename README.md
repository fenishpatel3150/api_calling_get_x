<h2 align = "center"> 1. Api Calling With GetX </h2>


### Validation with GetX in Flutter

Using GetX for validation in Flutter involves leveraging its reactive state management and utility functions to ensure form inputs meet specified criteria. Here’s a description of how to implement validation using GetX:

1. **Reactive Variables:** Use reactive variables (`obs`) to hold form input values and their corresponding error messages. This allows for automatic updates to the UI when the state changes.

2. **Validation Logic:** Implement validation logic within the controller. This involves defining methods to validate each form field based on specific criteria (e.g., checking if a field is empty, ensuring email format is correct, or enforcing password strength).

3. **Error Handling:** Store validation error messages in reactive variables. If a validation check fails, update the error variable with the appropriate message; otherwise, set it to null.

4. **Form Submission:** Before form submission, validate all form fields by calling the validation methods. Ensure that all error variables are null, indicating that the form is valid.

5. **UI Binding:** Bind form fields and error messages to the controller using GetX widgets such as `Obx`. This ensures that the UI reflects the latest validation states and provides immediate feedback to the user.

By following these steps, you can create a responsive and user-friendly validation system in your Flutter applications using GetX.


<details> 
  <summary><h2>📸Photo / 📽Video</h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/1ea2a7dc-8bd4-47d8-96df-46c8180a7b38" alt="Image 2" width="300" height="auto"></td>
        </td>
      </tr>
    </table>   
  </p>
</details>


To call an API in Flutter using GetX for state management, you can follow these steps:

1. **Add Dependencies**:
   First, add the necessary dependencies in your `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     get: ^4.3.8
     http: ^0.13.3
   ```

2. **Create a Model**:
   Create a model class for the data you want to fetch. For example, if you are fetching product details, you can create a `Product` model:
   ```dart
   class Product {
     final int id;
     final String title;
     final double price;
     final String description;
     final String category;
     final String image;
     final double rating;

     Product({
       required this.id,
       required this.title,
       required this.price,
       required this.description,
       required this.category,
       required this.image,
       required this.rating,
     });

     factory Product.fromJson(Map<String, dynamic> json) {
       return Product(
         id: json['id'],
         title: json['title'],
         price: json['price'],
         description: json['description'],
         category: json['category'],
         image: json['image'],
         rating: json['rating']['rate'].toDouble(),
       );
     }
   }
   ```

3. **Create a Service Class**:
   Create a service class to handle the API calls. For example:
   ```dart
   import 'dart:convert';
   import 'package:http/http.dart' as http;
   import 'product_model.dart';

   class ApiService {
     final String baseUrl = "https://fakestoreapi.com/products";

     Future<List<Product>> fetchProducts() async {
       final response = await http.get(Uri.parse(baseUrl));

       if (response.statusCode == 200) {
         List<dynamic> body = jsonDecode(response.body);
         List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
         return products;
       } else {
         throw Exception("Failed to load products");
       }
     }
   }
   ```

4. **Create a Controller**:
   Create a GetX controller to manage the state and fetch the data:
   ```dart
   import 'package:get/get.dart';
   import 'product_model.dart';
   import 'api_service.dart';

   class ProductController extends GetxController {
     var isLoading = true.obs;
     var productList = <Product>[].obs;

     @override
     void onInit() {
       fetchProducts();
       super.onInit();
     }

     void fetchProducts() async {
       try {
         isLoading(true);
         var products = await ApiService().fetchProducts();
         if (products.isNotEmpty) {
           productList.value = products;
         }
       } finally {
         isLoading(false);
       }
     }
   }
   ```

5. **Bind Controller to UI**:
   Finally, bind the controller to your UI to display the data. For example:
   ```dart
   import 'package:flutter/material.dart';
   import 'package:get/get.dart';
   import 'product_controller.dart';

   class ProductListPage extends StatelessWidget {
     final ProductController productController = Get.put(ProductController());

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Products')),
         body: Obx(() {
           if (productController.isLoading.value) {
             return Center(child: CircularProgressIndicator());
           } else {
             return ListView.builder(
               itemCount: productController.productList.length,
               itemBuilder: (context, index) {
                 return ListTile(
                   leading: Image.network(productController.productList[index].image),
                   title: Text(productController.productList[index].title),
                   subtitle: Text('\$${productController.productList[index].price.toString()}'),
                 );
               },
             );
           }
         }),
       );
     }
   }
   ```

This is a basic implementation of API calling using GetX in Flutter. Adjust the model, service, and controller as needed based on your API and application requirements.

<details> 
  <summary><h2>📸Photo / 📽Video</h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/3c894e74-a986-4c8e-8631-03a6055ff0c4" alt="Image 2" width="300" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/7b372ded-ee0c-4092-95de-5864c540219f" alt="Image 2" width="300" height="auto"></td>
        <td><video src="https://github.com/user-attachments/assets/b53a8683-1c85-4cce-9a01-cb65acd22a90" width="420" height="315"></video>
        </td>
      </tr>
    </table>   
  </p>
</details>



