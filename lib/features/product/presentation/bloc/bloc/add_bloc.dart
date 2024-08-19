import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/addProduct.dart';
import 'home_bloc.dart';

part '../events/add_event.dart';
part '../state/add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  late Addproduct addProduct;

  AddBloc(this.addProduct) : super((AddLoadingState())) {
    on<AddProductEvent>((event, emit) async{
      // TODO: implement event handler
      emit(AddLoadingState());
      var product = await addProduct(event.product);

      product.fold((l) => AddFailedState(), (r) => emit(SubmittedState(r)));

    });
  }
}
