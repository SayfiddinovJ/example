import 'package:equatable/equatable.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/data/status.dart';

class ProductState extends Equatable {
  const ProductState({
    required this.status,
    required this.products,
    this.product,
    required this.statusText,
    required this.categories,
    required this.selectedCategory,
  });

  final FormStatus status;
  final List<ProductModel> products;
  final List<String> categories;
  final ProductModel? product;
  final String statusText;
  final String selectedCategory;

  ProductState copyWith(
          {FormStatus? status,
          List<ProductModel>? products,
          List<String>? categories,
          ProductModel? product,
          String? statusText,
          String? selectedCategory}) =>
      ProductState(
        status: status ?? this.status,
        products: products ?? this.products,
        categories: categories ?? this.categories,
        statusText: statusText ?? this.statusText,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        product: product ?? this.product,
      );

  @override
  List<Object?> get props => [
        status,
        products,
        statusText,
        product,
        categories,
        selectedCategory,
      ];
}
