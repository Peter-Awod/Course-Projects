import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopify/models/product_model.dart';
import 'package:shopify/shared/network/api.dart';

import '../shared/components/constants.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    // http.Response response = await http.get(
    //   Uri.parse('https://fakestoreapi.com/products'),
    // );
    List<dynamic> json =await Api().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> products = [];

      for (int i = 0; i < json.length; i++) {
        products.add(
          ProductModel.fromJson(json[i]),
        );
      }
      return products;

    // if (response.statusCode == 200) {
    //   List<dynamic> json = jsonDecode(response.body);
    //   List<ProductModel> products = [];
    //   for (int i = 0; i < json.length; i++) {
    //     products.add(
    //       ProductModel.fromJson(json[i]),
    //     );
    //   }
    //   return products;
    // } else {
    //   print(
    //       'There was an error, return status code : ${response.statusCode}'
    //           ', with body : ${response.body}');
    //   throw Exception(
    //       'There was an error, return status code : ${response.statusCode}'
    //           ', with body : ${response.body}');
   // }


  }
}
