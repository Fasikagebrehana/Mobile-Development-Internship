import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login.dart';
part '../events/login_event.dart';
part '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  LoginBloc(this.login) : super(LoginInitial()) {
    on<LoginLoadedEvent>((event, emit) async{
      // TODO: implement event handler
      emit(LoginLoadingState());
      final user = await login(event.username, event.password);
      user.fold((l)=> emit(LoginFailedState()), (r)=> emit(LoginSuccessState('Success')));

    });
  }
}
