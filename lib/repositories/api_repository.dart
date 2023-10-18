import 'package:example/data/universal_data.dart';
import 'package:example/services/api_service.dart';

class ApiRepository {
  ApiRepository({required this.apiService});

  final ApiService apiService;

  Future<UniversalData> getCategories() async =>
      await apiService.getCategories();

  Future<UniversalData> getProducts() async => await apiService.getProducts();

  Future<UniversalData> getProductsByCategory(String category) async =>
      await apiService.getProductsByCategory(category: category);
}
