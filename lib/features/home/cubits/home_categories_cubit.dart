import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/cubits/home_categories_state.dart';
import 'package:marketi/features/home/models/category_model.dart';
import 'package:marketi/features/home/repo/home_repo.dart';

class HomeCategoryCubit extends Cubit<HomeCategoriesState> {
  HomeCategoryCubit({required this.homeRepo})
    : super(HomeCategoryInitialState());
  final HomeRepo homeRepo;

  fetchAllCategories() async {
    emit(HomeCategoryLoadingState());
    final response = await homeRepo.getAllCategories();
    response.fold(
      (error) {
        emit(HomeCategoryFailureState(errorMessage: error));
      },
      (categories) {
        categories.insert(0, CategoryModel(categoryName: 'All'));

        emit(HomeCategorySuccessState(categories: categories));
      },
    );
  }
}
