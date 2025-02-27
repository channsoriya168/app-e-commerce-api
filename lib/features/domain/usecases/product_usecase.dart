
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';
import 'package:app_ecommerce_api/features/domain/repositories/product_repository.dart';

class ProductUsecase {
  final ProductRepository productRepository;
  ProductUsecase({required this.productRepository});
Future<List<ProductEntity>> getAllProducts() async {
 try {
    var data=await productRepository.getAllProduct();
  return data;
 } catch (e) {
   throw Exception('Failed to load products in usecase: $e');
   
 }
}
Future<List<ProductEntity>> getProductByCategory(String category)async{
  try {
    var data=await productRepository.getProductByCategory(category);
    return data;
  } catch (e) {
    throw Exception(e);
  }
}
Future<ProductEntity> getProductById(int productId) async{
  try {
    var data=await productRepository.getProductById(productId);
    return data;
  } catch (e) {
    throw Exception(e);
  }
}
}