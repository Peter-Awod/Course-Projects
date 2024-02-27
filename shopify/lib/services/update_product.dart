import 'package:shopify/models/product_model.dart';
import 'package:shopify/shared/network/api.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required dynamic id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    print('ID ${id}');
    Map<String, dynamic> json =await Api().put(
      url: 'https://fakestoreapi.com/products/${id}',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    print('Json data ${json}');

    return ProductModel.fromJson(json);
  }
}
