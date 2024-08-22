part of '../bloc/login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;
  const LoginSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

final class LoginFailedState extends LoginState {}

