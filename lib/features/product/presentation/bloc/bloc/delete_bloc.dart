import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/deleteProduct.dart';

part '../events/delete_event.dart';
part '../state/delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {

  late Deleteproduct deleteProduct;

  DeleteBloc(this.deleteProduct) : super(DeleteLoadingState()) {
    on<DeleteProductEvent>((event, emit) async{
      
      emit(DeleteLoadingState());
      var product = await deleteProduct(event.id);
      product.fold((l) => DeleteFailedState(), (r) => emit(DeleteLoadedState(r)));
    });
  }
}