import 'package:example/bloc/product_event.dart';
import 'package:example/bloc/product_state.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/data/status.dart';
import 'package:example/data/universal_data.dart';
import 'package:example/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.apiRepository})
      : super(
          const ProductState(
            status: FormStatus.pure,
            products: [],
            statusText: '',
            categories: [],
            selectedCategory: 'All',
          ),
        ) {
    on<GetAll>(_getAll);
    on<ChangeCategory>(_changeCategory);
    on<GetProductByCategory>(_getProductsByCategory);
  }

  final ApiRepository apiRepository;

  _getAll(GetAll event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData categoryData = await apiRepository.getCategories();
    UniversalData productData = await apiRepository.getProducts();
    if (categoryData.error.isEmpty && productData.error.isEmpty) {
      List<String> categories = categoryData.data as List<String>;
      categories.insert(0, 'All');
      emit(
        state.copyWith(
          statusText: 'Data arrived',
          status: FormStatus.success,
          categories: categories,
          products: productData.data as List<ProductModel>,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusText: 'API is empty',
          status: FormStatus.error,
          categories: state.categories,
          products: state.products,
        ),
      );
    }
  }

  _changeCategory(ChangeCategory event, Emitter<ProductState> emit) async {
    emit(state.copyWith(selectedCategory: event.category));
  }

  _getProductsByCategory(
      GetProductByCategory event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData data = await apiRepository.getProductsByCategory(
      state.selectedCategory.toLowerCase(),
    );
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusText: 'Data arrived',
          status: FormStatus.success,
          products: data.data as List<ProductModel>,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusText: 'API is empty',
          status: FormStatus.error,
        ),
      );
    }
  }
}
