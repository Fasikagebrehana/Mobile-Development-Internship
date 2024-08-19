import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/failure/exceptions.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/updateProduct.dart';

part '../events/update_event.dart';
part '../state/update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  late UpdateProduct updateProduct;
  UpdateBloc(this.updateProduct) : super(UpdateLoadingState()) {
    on<UpdateProductEvent>((event, emit) async{
      // TODO: implement evenrepositoryt handler
      try {
        emit(UpdateLoadingState());
      var product = await updateProduct(event.product);
      print(product);
      product.fold(
        (l) => emit(UpdateFailedState()),
      (r) => emit(UpdateLoadedState(r)));
      print(state);
      } catch(e){
        print(e);
      }

    });
  }
  @override
  void onChange(Change<UpdateState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change.currentState);
    print(change.nextState);
  }
}
