import 'package:shopify/models/product_model.dart';
import 'package:shopify/shared/network/api.dart';

class AddNewProductService {
  Future<ProductModel> addNewProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> json =await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(json);
  }
}
