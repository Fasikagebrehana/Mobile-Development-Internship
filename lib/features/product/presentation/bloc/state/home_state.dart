part of '../bloc/home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}


final class LoadingState extends HomeState {

}

final class LoadedState extends HomeState {
  final List<Product> data;
  const LoadedState(this.data);

  @override
  List<Object> get props => [data];

}


final class FailedState extends HomeState {
  final String message;
  const FailedState(this.message);
}

