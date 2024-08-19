part of '../bloc/add_bloc.dart';

sealed class AddState extends Equatable {
  const AddState();
  
  @override
  List<Object> get props => [];
}

final class AddInitial extends AddState {}

final class AddLoadingState extends AddState {}

final class SubmittingState extends AddState {
}

final class SubmittedState extends AddState {
  final Product product;
  const SubmittedState(this.product);
  @override
  List<Object> get props => [product];

}


final class AddFailedState extends AddState{}
