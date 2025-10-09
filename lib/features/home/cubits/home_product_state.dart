import 'package:marketi/features/home/models/product_model.dart';

abstract class HomeProductState {}

class HomeProductInitialState extends HomeProductState {}

class HomeProductLoadingState extends HomeProductState {}

class HomeProductSuccessState extends HomeProductState {
  HomeProductSuccessState({required this.products});
  final List<ProductModel> products;
}

class HomeProductFailureState extends HomeProductState {
  HomeProductFailureState({required this.errorMessage});
  final String errorMessage;
}
