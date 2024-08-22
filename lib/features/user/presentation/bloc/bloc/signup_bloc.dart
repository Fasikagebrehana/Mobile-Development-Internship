import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/signup.dart';
import '../../pages/signup.dart';
// import '../../pages/signup.dart';

part '../events/signup_event.dart';
part '../state/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupUsecase signup;
  SignupBloc(this.signup) : super(SignupInitial()) {
    on<SignupLoadedEvent>((event, emit) async{
      // TODO: implement event handler
      emit(SignupLoadingState());
      final user = await signup(event.name, event.username, event.password);
      // print(user);
      // final user = User(username: 'fasik', password: "password");
      user.fold((l) => emit(SignupFailedState()), (r)=> emit(SignupSuccessState(r)));
      // emit(SignupSuccessState(user));
      // print(state);
    });
  }
}
