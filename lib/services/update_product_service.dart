import 'package:my_app/helpers/api.dart';
import 'package:my_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> UpdateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required dynamic id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
