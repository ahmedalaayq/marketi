class CategoryModel {
  final String categoryName;

  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(String categoryName) {
    return CategoryModel(categoryName: categoryName);
  }

  Map<String, dynamic> toJson() {
    return {"categoryName": categoryName};
  }
}
