import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/getAllProduct.dart';

part '../events/search_event.dart'; // Corrected: Importing events
part '../state/search_state.dart'; // Corrected: Importing states

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetAllProduct getAllProduct;

  SearchBloc(this.getAllProduct) : super(LoadingState()) {
    on<LoadAllProductEvent>(_onLoadAllProducts);
    on<SearchProductEvent>(_onSearchProducts);
  }

  void _onLoadAllProducts(LoadAllProductEvent event, Emitter<SearchState> emit) async {
    emit(LoadingState());
    var products = await getAllProduct();
    products.fold(
      (failure) => emit(FailedState(failure.message)),
      (productList) => emit(LoadedState(productList)),
    );
  }

  void _onSearchProducts(SearchProductEvent event, Emitter<SearchState> emit) {
    if (state is LoadedState) {
      final currentState = state as LoadedState;
      final filteredProducts = currentState.data.where((product) =>
          product.name.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(LoadedState(filteredProducts));
    }
  }
}
