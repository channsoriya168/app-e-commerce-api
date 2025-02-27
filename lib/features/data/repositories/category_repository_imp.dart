
import 'package:app_ecommerce_api/features/data/datasources/category_remote_data.dart';
import 'package:app_ecommerce_api/features/domain/entities/category_entity.dart';
import 'package:app_ecommerce_api/features/domain/repositories/category_repository.dart';

class CategoryRepositoryImp implements CategoryRepository {
 final CategoryRemoteData categoryRemoteData;
  CategoryRepositoryImp({required this.categoryRemoteData});

  @override
  Future<List<CategoryEntity>> fetchCategory() async{
  try {
     List<String> categories = await categoryRemoteData.getCategories();

      return categories.map((category) => CategoryEntity(name: category)).toList();
  } catch (e) {
   throw Exception('Failed to fetch categories: $e');
  }
  }

  
}