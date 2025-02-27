
import 'package:app_ecommerce_api/features/domain/entities/category_entity.dart';
import 'package:app_ecommerce_api/features/domain/repositories/category_repository.dart';

class CategoryUsecase {
  final CategoryRepository _categoryRepository;

  CategoryUsecase(this._categoryRepository);

  Future<List<CategoryEntity>> getCategories() async {
    var data=await _categoryRepository.fetchCategory();
    return data;
  }
  
}