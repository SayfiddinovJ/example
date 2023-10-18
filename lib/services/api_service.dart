import 'package:dio/dio.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/data/universal_data.dart';
import 'package:example/utils/constants.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV YUBORILDI :${handler.isCompleted}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB KELDI :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getCategories() async {
    Response response;
    try {
      response = await dio.get('/products/categories/');
      if (response.statusCode == 200) {
        return UniversalData(
          data: (response.data as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );
      }
      return UniversalData(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getProducts() async {
    Response response;
    try {
      response = await dio.get('/products/');
      if (response.statusCode == 200) {
        return UniversalData(
          data: (response.data as List?)
                  ?.map((e) => ProductModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getProductsByCategory(
      {required String category}) async {
    Response response;
    if (category == 'all') category = '';
    try {
      response = await dio.get(
          category.isNotEmpty ? '/products/category/$category/' : "/products/");
      if (response.statusCode == 200) {
        return UniversalData(
          data: (response.data as List?)
                  ?.map((e) => ProductModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'Error: Status code not equal to 200');
    } catch (e) {
      debugPrint('$e');
      return UniversalData(error: e.toString());
    }
  }
}
