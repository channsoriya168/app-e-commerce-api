
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';
import 'package:app_ecommerce_api/features/domain/usecases/product_usecase.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final ProductUsecase productUsecase;
  ProductController({required this.productUsecase});
  var products = [].obs;
  var cart=[].obs;
  var isLoading = true.obs;

@override
  void onInit(){
  super.onInit();
   getAllProducts();

}
  // get all products
  Future<void> getAllProducts() async {
    isLoading(true);
    final result = await productUsecase.getAllProducts();
    if(result.isNotEmpty){
      products(result);
    }
    isLoading(false);
  }
Future<void> getProudctByCategory(String category) async {
    isLoading(true);
     if(category=="All"){
       getAllProducts();
     }else{
      final result = await productUsecase.getProductByCategory(category);
      products(result);
     }
     
    isLoading(false);
  }
  void addToCart(ProductEntity product){
    cart.add(product);
  }
  void removeFromCart(ProductEntity product){
    cart.remove(product);
  }
  void clearCart(){
    cart.clear();
  }
}