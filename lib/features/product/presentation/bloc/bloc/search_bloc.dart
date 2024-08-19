import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../dependency_injection.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/getAllProduct.dart';
import '../../../domain/usecases/getproduct.dart';

part '../events/search_event.dart';
part '../state/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late GetAllProduct getAllProduct;
  SearchBloc(this.getAllProduct) : super(LoadingState()) {
    on<SearchEvent>((event, emit) async{
      // TODO: implement event handler
      emit(LoadingState());
      var products = await getAllProduct();
      products.fold((l)=> FailedState(l.message), (r) => emit(LoadedState(r)));

    });
  }
}
