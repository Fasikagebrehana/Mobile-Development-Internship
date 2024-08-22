part of '../bloc/profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileLoadedEvent extends ProfileEvent {}
