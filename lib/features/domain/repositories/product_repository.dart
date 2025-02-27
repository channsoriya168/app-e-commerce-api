
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProduct();
  Future<List<ProductEntity>> getProductByCategory(String category);
  Future<ProductEntity> getProductById(int productId);
}