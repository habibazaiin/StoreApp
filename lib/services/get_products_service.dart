import 'package:my_app/helpers/api.dart';
import 'package:my_app/models/product_model.dart';

class GetProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> products = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );
    List<ProductModel> productList = [];
    for (int i = 0; i < products.length; i++) {
      productList.add(ProductModel.fromJson(products[i]));
    }
    return productList;
  }
}
