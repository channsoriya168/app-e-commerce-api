import 'package:dio/dio.dart';

class CategoryRemoteData{
    final Dio dio = Dio();
  String url='https://fakestoreapi.com/products/categories';
  Future<List<String>> getCategories() async {
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200 && response.data is List) {
      List<String> categories = List<String>.from(response.data);
      categories.insert(0, "All"); // ✅ Add "All" category manually
      return categories;
      }else{
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception(e);
    }
}
}