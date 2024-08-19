import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/repositories/productRepository.dart';
import '../../../domain/usecases/getAllProduct.dart';

part '../events/home_event.dart';
part '../state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late GetAllProduct getAllProduct;
  late ProductRepository productRepository;
  HomeBloc(this.getAllProduct) : super(LoadingState()) {
    on<HomeEvent>((event, emit) async{
      emit(LoadingState());
      var products = await getAllProduct();
      
      products.fold((l) => FailedState(l.message), (r)=> emit(LoadedState(r)));
    });
  }
  
}
