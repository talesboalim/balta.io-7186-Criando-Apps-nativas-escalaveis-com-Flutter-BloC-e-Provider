import 'dart:convert';
import '../models/category-list-item.model.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    Iterable l = json.decode(jsonCategories());
    List<CategoryListItemModel> categories =
        l.map((course) => CategoryListItemModel.fromJson(course)).toList();

    return (categories);
    /*
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
    */
  }

  String jsonCategories() {
    var jsonStr = """
[
  {
    "id": "1",
    "title": "Automotivo",
    "tag": "automotivo"
  },
  {
    "id": "2",
    "title": "Brinquedos",
    "tag": "brinquedos"
  },
  {
    "id": "3",
    "title": "Decoração",
    "tag": "decor"
  },
  {
    "id": "4",
    "title": "Eletrodomésticos",
    "tag": "eletrodomesticos"
  },
  {
    "id": "5",
    "title": "Games",
    "tag": "games"
  },
  {
    "id": "6",
    "title": "Informática",
    "tag": "informatica"
  },
  {
    "id": "7",
    "title": "Moda",
    "tag": "moda"
  },
  {
    "id": "8",
    "title": "Telefonia",
    "tag": "telefonia"
  },
  {
    "id":"9",
    "title": "TV",
    "tag": "tv"
  }
]
""";
    return jsonStr;
  }
}
