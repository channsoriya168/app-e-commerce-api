
import 'package:app_ecommerce_api/features/data/models/product_model.dart';

class ProductEntity {
    int id;
    String title;
    double price;
    String description;
    String category;
    String image;
    Rating rating;

    ProductEntity({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

}