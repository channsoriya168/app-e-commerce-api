
import 'package:app_ecommerce_api/features/domain/usecases/category_usecase.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = [].obs;
  var isLoading = true.obs;
  var selectIndex=0.obs;
  CategoryUsecase _categoryUsecase;
  CategoryController(this._categoryUsecase);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
// function 
Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categoriesResult = await _categoryUsecase.getCategories();
      if(categoriesResult.isNotEmpty){
        categories(categoriesResult);
      }
      
    } finally {
      isLoading(false);
    }
}
void setSelectIndex(int index){
  selectIndex.value=index;

}
}