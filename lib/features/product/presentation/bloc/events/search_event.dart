part of '../bloc/search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class LoadAllProductEvent extends SearchEvent {}