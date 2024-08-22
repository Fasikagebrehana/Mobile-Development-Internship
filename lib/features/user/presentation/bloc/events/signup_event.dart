part of '../bloc/signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
final class SignupLoadedEvent extends SignupEvent {
  final String name;
  final String username;
  final String password;

  SignupLoadedEvent({required this.name, required this.username, required this.password});

  @override
  List<Object> get props => [name, username, password];
}