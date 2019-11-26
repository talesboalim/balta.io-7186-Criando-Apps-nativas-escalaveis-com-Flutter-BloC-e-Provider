import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shoppingcartapp/models/authenticate-user.model.dart';
import 'package:shoppingcartapp/models/create-user.model.dart';
import 'package:shoppingcartapp/models/user.model.dart';
import '../settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticateModel model) async {
    Iterable l = json.decode(jsonAccountList());
    List<UserModel> usuario = l.map((u) => UserModel.fromJson(u)).toList();
    return (usuario.where((x) => x.username == model.username).first);
    //  O servidor da API está offline. O código acima apenas
    //autentica pelo nome do usuário

    /*
    var url = "${Settings.apiUrl}v1/account/login";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
    */
  }

  Future<UserModel> create(CreateUserModel model) async {
    var url = "${Settings.apiUrl}v1/account";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  String jsonAccountList() {
    var jsonStr = """
[
  {
    "id": "1",
    "name": "Batman",
    "email": "batman@batman.com.br",
    "username": "batman",
    "password": "batman",
    "image": "",
    "role": "",
    "token": ""
  },
  {
    "id": "2",
    "name": "Tales",
    "email": "tales@tales.com.br",
    "username": "tales",
    "password": "123",
    "image": "",
    "role": "",
    "token": ""

  }
]
""";
    return jsonStr;
  }
}
