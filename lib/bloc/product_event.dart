import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class GetAll extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCategory extends ProductEvent {
  final String category;

  ChangeCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class GetProductByCategory extends ProductEvent {
  @override
  List<Object?> get props => [];
}
