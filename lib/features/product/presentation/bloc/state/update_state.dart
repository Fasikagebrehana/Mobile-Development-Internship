part of '../bloc/update_bloc.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();
  
  @override
  List<Object> get props => [];
}

final class UpdateInitial extends UpdateState {}

final class UpdateLoadingState extends UpdateState {}

final class UpdateLoadedState extends UpdateState {
  Product product;
  UpdateLoadedState(this.product);
  @override
  List<Object> get props => [product];
}

final class UpdateFailedState extends UpdateState {}

