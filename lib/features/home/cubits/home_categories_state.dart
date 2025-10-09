import 'package:marketi/features/home/models/category_model.dart';
abstract class HomeCategoriesState {}

class HomeCategoryInitialState extends HomeCategoriesState {}

class HomeCategoryLoadingState extends HomeCategoriesState {}

class HomeCategorySuccessState extends HomeCategoriesState {
  HomeCategorySuccessState({required this.categories});
  final List<CategoryModel> categories;
}

class HomeCategoryFailureState extends HomeCategoriesState {
  HomeCategoryFailureState({required this.errorMessage});
  final String errorMessage;
}
