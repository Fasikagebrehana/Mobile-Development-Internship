import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../events/detail_event.dart';
part '../state/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
