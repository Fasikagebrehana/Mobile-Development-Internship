part of '../bloc/signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {

}

final class SignupSuccessState extends SignupState {

  User t;
  SignupSuccessState(this.t);
  // String name;
  // String username;
  // String password;

  // SignupSuccessState({required this.name, required this.username, required this.password});
  @override
  List<Object> get props => [t];

}

final class SignupFailedState extends SignupState {}