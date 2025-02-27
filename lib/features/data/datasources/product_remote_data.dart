import 'package:app_ecommerce_api/features/data/models/product_model.dart';
import 'package:dio/dio.dart';


class ProductRemoteData {
  final Dio dio=Dio();
  final String url='https://fakestoreapi.com/products';
Future<List<ProductModel>> getAllProduct() async {
  try {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
        List data=response.data;
        return data.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products ');
    }
  } catch (e) {
    throw Exception('Failed to load products $e');
  }
}
Future<List<ProductModel>> getProductByCategory(String category) async {
 try {
  final response = await dio.get('$url/category/$category');
  if (response.statusCode == 200) {
      List data=await response.data;
      return data.map((product) => ProductModel.fromJson(product)).toList();
  } else {
    throw Exception('Failed to load products');
  }
 } catch (e) {
   throw Exception('Failed to load products $e');
 }
}
Future<ProductModel> getProductById(int productId) async {
 try {
  final response = await dio.get('$url/$productId');
  if (response.statusCode == 200) {
      Map<String,dynamic> data=await response.data;
      return ProductModel.fromJson(data);
  } else {
    throw Exception('Failed to load products remote data');
  }
 } catch (e) {
   throw Exception('Failed to load products remote data $e');
 }
}
}