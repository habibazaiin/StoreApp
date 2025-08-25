import 'package:dio/dio.dart';
import 'package:my_app/helpers/api.dart';
import 'package:my_app/models/product_model.dart';

class AddProductService {
  final Dio dio = Dio();
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
