part of '../bloc/delete_bloc.dart';

sealed class DeleteState extends Equatable {
  const DeleteState();
  
  @override
  List<Object> get props => [];
}

final class DeleteInitial extends DeleteState {}

final class DeleteLoadingState extends DeleteState {}

final class DeleteLoadedState extends DeleteState {
  // late Deleteproduct deleteproduct;

  // DeleteLoadedState(this.deleteproduct);

  // @override
  // List<Object> get props => [];

  String id;
  DeleteLoadedState(this.id);

  @override
  List<Object> get props => [id];
  
}

final class DeleteFailedState extends DeleteState {}

