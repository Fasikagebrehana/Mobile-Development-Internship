part of '../bloc/update_bloc.dart';

sealed class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateProductEvent extends UpdateEvent {
  
  final Product product;
  UpdateProductEvent({required this.product});
}
