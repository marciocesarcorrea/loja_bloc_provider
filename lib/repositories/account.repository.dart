import 'package:dio/dio.dart';
import 'package:loja_bloc_provider/models/user.model.dart';
import 'package:loja_bloc_provider/settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(UserModel model) async {
    var url = "${Settings.apiUrl}v1/account/login";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(UserModel model) async {
    var url = "${Settings.apiUrl}v1/account";
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }
}
