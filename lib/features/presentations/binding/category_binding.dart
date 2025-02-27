
import 'package:app_ecommerce_api/features/data/datasources/category_remote_data.dart';
import 'package:app_ecommerce_api/features/domain/repositories/category_repository.dart';
import 'package:app_ecommerce_api/features/domain/usecases/category_usecase.dart';
import 'package:app_ecommerce_api/features/presentations/controller/category_controller.dart';
import 'package:get/get.dart';

import '../../data/repositories/category_repository_imp.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryRemoteData());
     Get.lazyPut<CategoryRepository>(() =>CategoryRepositoryImp(categoryRemoteData: Get.find()));
    Get.lazyPut(() => CategoryUsecase(Get.find()));
    Get.lazyPut(() => CategoryController(Get.find()));
  }

  
}