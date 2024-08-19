part of '../bloc/delete_bloc.dart';

sealed class DeleteEvent extends Equatable {
  const DeleteEvent();

  @override
  List<Object> get props => [];
}

class DeleteProductEvent extends DeleteEvent {
  String id;
  DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
