import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../product/presentation/bloc/bloc/home_bloc.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/profile.dart';

part '../events/profile_event.dart';
part '../state/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  Profile profile;
  ProfileBloc(this.profile) : super(ProfileInitial()) {
    on<ProfileLoadedEvent>((event, emit) async{
      // TODO: implement event handler
      print('object');
      
      emit(ProfileLoadingState());
      final result = await profile();
      result.fold((l) => emit(ProfileFailedState()), (r) => emit(ProfileLoadedState(r)));
    });
  }
}
