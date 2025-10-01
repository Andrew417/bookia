import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/features/main/data/models/book_product_response/book_product_response.dart';

class HomeRepo {
  static Future<BookProductResponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsBestSeller,
      );
      if (res.statusCode == 200) {
        var data = BookProductResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookProductResponse?> getNewArrivals() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsNewArrival,
      );
      if (res.statusCode == 200) {
        var data = BookProductResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookProductResponse?> getAllProducts([
    int pageIndex = 1,
  ]) async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsNewArrival,
        queryParameters: {'page': pageIndex},
      );
      if (res.statusCode == 200) {
        var data = BookProductResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
