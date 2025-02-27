
import 'package:app_ecommerce_api/features/data/datasources/product_remote_data.dart';
import 'package:app_ecommerce_api/features/data/repositories/product_repository_imp.dart';
import 'package:app_ecommerce_api/features/domain/repositories/product_repository.dart';
import 'package:app_ecommerce_api/features/domain/usecases/product_usecase.dart';
import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => ProductRemoteData(),);
   Get.lazyPut<ProductRepository>(() =>ProductRepositoryImp(productRemoteData: Get.find()) ,);
   Get.lazyPut(() => ProductUsecase(productRepository: Get.find()),);
   Get.lazyPut(() => ProductController(productUsecase: Get.find()),);
  }
  
}