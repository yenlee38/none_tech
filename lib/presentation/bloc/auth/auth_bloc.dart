import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:none_tech/presentation/bloc/auth/auth_event.dart';
import 'package:none_tech/presentation/bloc/auth/export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on<LoginEvent>(login);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {

  }

}