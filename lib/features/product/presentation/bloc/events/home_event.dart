part of '../bloc/home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
class LoadAllProductEvent extends HomeEvent {}