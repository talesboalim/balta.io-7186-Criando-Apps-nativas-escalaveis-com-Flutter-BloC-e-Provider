import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/product-details.model.dart';
import '../models/product-list-item.model.dart';
import '../settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    Iterable l = json.decode(jsonProducts());
    List<ProductListItemModel> categories =
        l.map((course) => ProductListItemModel.fromJson(course)).toList();

    return (categories);
    /*
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
    */
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/categories/$tag";
    Response response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }

  String jsonProducts() {
    var jsonStr = """
[
  {
    "id": "1",
    "title": "Limpador",
    "tag": "limpador",
    "price": "100",
    "description": "Limpador automotivo",
    "brand": "Limpeza Free",
    "images": "limpador",
    "category": "automotivo"
  }
]
""";
    return jsonStr;
  }
}
