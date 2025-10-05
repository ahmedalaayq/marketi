import 'package:marketi/features/auth/models/auth_response_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final AuthResponseModel responseModel;
  AuthSuccessState({required this.responseModel});
}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState({required this.errorMessage});
}
