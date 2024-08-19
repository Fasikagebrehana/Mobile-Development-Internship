part of '../bloc/add_bloc.dart';

sealed class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends AddEvent {
  final Product product;
  
  AddProductEvent({required this.product});
}
