import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/product-details.model.dart';
import '../models/product-list-item.model.dart';
import '../settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    Iterable l = json.decode(jsonProductsList());
    List<ProductListItemModel> products =
        l.map((p) => ProductListItemModel.fromJson(p)).toList();

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
    Iterable l = json.decode(jsonProductsList());
    List<ProductListItemModel> products =
        l.map((p) => ProductListItemModel.fromJson(p)).toList();
    return (products.where((x) => x.tag == category).toList());
    /*
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => ProductListItemModel.fromJson(course))
        .toList();
    */
  }

  Future<ProductDetailsModel> get(String id) async {
    Iterable l = json.decode(jsonProductsList());
    List<ProductDetailsModel> product =
        l.map((p) => ProductDetailsModel.fromJson(p)).toList();
    return (product.where((x) => x.id == id).first);

    /*
    var url = "${Settings.apiUrl}v1/categories/$tag";
    Response response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
    */
  }

  String jsonProductsList() {
    var jsonStr = """
[
  {
    "id": "1",
    "title": "GPS Automotivo Garmin Drive 51",
    "tag": "automotivo",
    "description": "Navegador GPS dedicado e fácil de usar com visor brilhante de orientação dupla de 5.0 polegadas",
    "brand": "Garmin",
    "price": 809.00,
    "category": {
      "id": "1"
    },
    "image": "https://images-americanas.b2w.io/produtos/01/00/img/52906/8/52906838_1GG.jpg",    
    "images": 
    [
      "https://images-americanas.b2w.io/produtos/01/00/img/52906/8/52906838_1GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img/52906/8/52906838_2GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img/52906/8/52906838_3GG.jpg"
    ]
  },
  {
    "id": "2",
    "title": "Smartphone Motorola One 64GB",
    "tag": "telefonia",
    "description": "O Motorola One, lançamento da Motorola, é a estreia do sistema operacional Android One no Brasil, versão que promete maior integração com as ferramentas e inovações Google.",
    "brand": "Motorola",    
    "price": 999.00,
    "category": {
      "id": "8"
    },
    "image": "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348423-45-3d-37.jpg",
    "images": 
    [
      "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348423-12-3d-37.jpg",
      "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348600-12-16-37.jpg",
      "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348780-12-3f-37.jpg",
      "https://i.zst.com.br/images/smartphone-motorolaone-xt1941-3-64gb-camera-dupla-qualcomm-snapdragon-625-2-chips-android-8-1-oreo-3g-4g-wi-fi-photo680348961-12-2c-37.jpg"
    ]
  }
  ,
  {
    "id": "3",
    "title": "Notebook Samsung Essentials E30",
    "tag": "informatica",
    "description": "O Samsung Essentials foi desenvolvido para quem busca um notebook de alta qualidade, com design elegante e detalhes que surpreendem. Seja para uso individual ou para compartilhar com a família, para navegar em redes sociais e sites ..",
    "brand": "Samsung",    
    "price": 1709.99,
    "category": {
      "id": "6"
    },
    "image": "https://i.zst.com.br/images/notebook-samsung-essentials-intel-core-i3-7020u-7-geracao-4gb-de-ram-hd-1-tb-15-6-full-hd-windows-10-e30-photo518274325-45-6-f.jpg",
    "images": 
    [
      "https://images-americanas.b2w.io/produtos/01/00/img/133794/1/133794131_1GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img/133794/1/133794131_2GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img/133794/1/133794131_4GG.jpg"
    ]
  },
  {
    "id": "4",
    "title": "Smartphone Samsung Galaxy M20 64GB",
    "tag": "telefonia",
    "description": "Desenvolvido especialmente para quem busca por um celular moderno sem precisar gastar muito, o Galaxy M20 é a melhor opção. Com câmeras potentes que registram praticamente tudo, o novo lançamento da Samsung ainda vem recheado de recursos que facilitam sua vida. Confira! :)",
    "brand": "Samsung",    
    "price": 1079.00,
    "category": {
      "id": "8"
    },
    "image": "https://images-americanas.b2w.io/produtos/01/00/img2/134252/8/134252810_1GG.jpg",
    "images": 
    [
      "https://images-americanas.b2w.io/produtos/01/00/img2/134253/7/134253791_1GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img2/134253/7/134253791_2GG.jpg",
      "https://images-americanas.b2w.io/produtos/01/00/img2/134253/7/134253791_4GG.jpg"
    ]
  }

]
""";
    return jsonStr;
  }
}
