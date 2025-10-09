import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/cubit/auth_state.dart';
import 'package:marketi/features/auth/models/auth_response_model.dart';
import 'package:marketi/features/auth/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  final AuthRepo authRepo;

  login({required String userName, required String password}) async {
    emit(AuthLoadingState());
    Either<String, AuthResponseModel> response = await authRepo.login(
      userName: userName,
      password: password,
    );

    response.fold(
      (error) {
        emit(AuthFailureState(errorMessage: error));
      },
      (success) {
        emit(AuthSuccessState(responseModel: success));
      },
    );
  }
}
