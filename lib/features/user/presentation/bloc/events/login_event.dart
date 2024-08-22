part of '../bloc/login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginLoadedEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginLoadedEvent({ required this.username,  required this.password});

  @override
  List<Object> get props => [username, password];
}
