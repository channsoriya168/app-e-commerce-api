
import 'package:app_ecommerce_api/features/domain/entities/category_entity.dart';

abstract class CategoryRepository{
  Future<List<CategoryEntity>> fetchCategory();
}