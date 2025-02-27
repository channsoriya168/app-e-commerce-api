class CategoryModel{
   final String name;
    CategoryModel({required this.name});
    // Factory method to create a CategoryModel from a JSON string
  factory CategoryModel.fromJson(String json) {
    return CategoryModel(name: json);
  }
  // convert the model to api
  Map<String, dynamic> toJson(){
    return {
      'name': name,
    };
  }
}