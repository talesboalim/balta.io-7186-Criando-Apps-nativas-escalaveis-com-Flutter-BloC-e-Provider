import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/product-details.model.dart';
import '../models/product-list-item.model.dart';
import '../settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    Iterable l = json.decode(jsonProducts());
    List<ProductListItemModel> products =
        l.map((course) => ProductListItemModel.fromJson(course)).toList();

    return (products);
    /*
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
    */
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    Iterable l = json.decode(jsonProducts());
    List<ProductListItemModel> products =
        l.map((course) => ProductListItemModel.fromJson(course)).toList();
    return (products.where((x) => x.tag == category).toList());
    /*
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
    */
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
    "title": "GPS Automotivo Garmin Drive 51",
    "brand": "Garmin",
    "tag": "automotivo",
    "price": 809.00,
    "image": "https://images-americanas.b2w.io/produtos/01/00/img/52906/8/52906838_1GG.jpg"
  },
  {
    "id": "2",
    "title": "Smartphone Motorola One 64GB",
    "brand": "Motorola",
    "tag": "telefonia",
    "price": 999.00,
    "image": "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348423-45-3d-37.jpg"
  }
  ,
  {
    "id": "3",
    "title": "Notebook Samsung Essentials E30",
    "brand": "Samsung",
    "tag": "informatica",
    "price": 1709.99,
    "image": "https://i.zst.com.br/images/notebook-samsung-essentials-intel-core-i3-7020u-7-geracao-4gb-de-ram-hd-1-tb-15-6-full-hd-windows-10-e30-photo518274325-45-6-f.jpg"
  },
  {
    "id": "4",
    "title": "Smartphone Samsung Galaxy M20 64GB",
    "brand": "Samsung",
    "tag": "telefonia",
    "price": 1079.00,
    "image": "https://images-americanas.b2w.io/produtos/01/00/img2/134252/8/134252810_1GG.jpg"
  }

]
""";
    return jsonStr;
  }
}
