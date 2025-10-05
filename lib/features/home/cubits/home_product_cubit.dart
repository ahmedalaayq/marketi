import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/cubits/home_product_state.dart';
import 'package:marketi/features/home/repo/home_repo.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  HomeProductCubit({required this.homeRepo}) : super(HomeProductInitialState());
  final HomeRepo homeRepo;

  fetchAllProducts() async {
    emit(HomeProductLoadingState());
    final response = await homeRepo.getAllProducts();
    response.fold(
      (error) {
        emit(HomeProductFailureState(errorMessage: error));
      },
      (products) {
        emit(HomeProductSuccessState(products: products));
      },
    );
  }
}
