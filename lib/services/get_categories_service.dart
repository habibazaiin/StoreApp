import 'package:dio/dio.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/helpers/api.dart';

class GetCategoriesService {
  final Dio dio = Dio();
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(url: '$kBaseUrl/categories');

    return categories;
  }
}
