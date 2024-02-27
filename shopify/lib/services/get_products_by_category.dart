import '../models/product_model.dart';
import '../shared/network/api.dart';

class GetProductsByCategoryService {
  Future<List<ProductModel>> getProductsByCAtegory(
      {required String categoryName}) async {
    List<dynamic> json = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> products = [];
    for (int i = 0; i < json.length; i++) {
      products.add(
        ProductModel.fromJson(json[i]),
      );
    }
    return products;
  }
}
