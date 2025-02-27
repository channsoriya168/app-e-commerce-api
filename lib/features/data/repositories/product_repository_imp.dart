import 'package:app_ecommerce_api/features/data/datasources/product_remote_data.dart';
import 'package:app_ecommerce_api/features/data/models/product_model.dart';
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';
import 'package:app_ecommerce_api/features/domain/repositories/product_repository.dart';

import 'package:get/get.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteData productRemoteData;

  ProductRepositoryImp({required this.productRemoteData});
  
   @override
  Future<List<ProductEntity>> getAllProduct() async {
    try {
      List<ProductModel> data = await productRemoteData.getAllProduct();
      return data.map((product) => ProductEntity(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
        rating: Rating(
          rate: product.rating.rate,
           count: product.rating.count)
        
      )).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  
  @override
  Future<List<ProductEntity>> getProductByCategory(String category) async{
     try {
       List<ProductModel> data =await productRemoteData.getProductByCategory(category);
      return data.map((product) => ProductEntity(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
          rating: Rating(
          rate: product.rating.rate,
           count: product.rating.count)
      )).toList();
     } catch (e) {
       throw Exception('Failed to load products $e');
     }
  }
  
  @override
  Future<ProductEntity> getProductById(int productId) async{
    try {
     final data = await productRemoteData.getProductById(productId);
      return ProductEntity(
        id: data.id,
        title: data.title,
        price: data.price,
        description: data.description,
        category: data.category,
        image: data.image,
        rating: Rating(
          rate: data.rating.rate,
           count: data.rating.count)
      );
    } catch (e) {
      throw Exception('Failed to load products $e');
      
    }
  }

  
}