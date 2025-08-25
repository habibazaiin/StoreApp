import 'package:dio/dio.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/helpers/api.dart';
import 'package:my_app/models/product_model.dart';

class GetCategoryProduct {
  final Dio dio = Dio();
  Future<List<dynamic>> getCategoryProduct({
    required String categoryName,
  }) async {
    List<dynamic> products = await Api().get(
      url: '$kBaseUrl/categories/$categoryName',
    );
    List<ProductModel> productList = [];
    for (int i = 0; i < products.length; i++) {
      productList.add(ProductModel.fromJson(products[i]));
    }
    return productList;
  }
}
