import 'dart:convert';

import 'package:chairil/core/app/endpoint.dart';
import 'package:chairil/core/data/model/store.dart';
import 'package:chairil/core/network/dio_service.dart';
import 'package:chairil/data/database/store_box.dart';
import 'package:dio/dio.dart';

class LoginRepository {

  Future<List<StoreBox>?> login(FormData formData) async {
    var dio = await DioService.checkConnection(tryAgainMethod: login, isLoading: true);
    var response = await dio.post(Endpoint.login, data: formData);
    ResponseAPI responseAPI = ResponseAPI.fromJson(jsonDecode(response.toString()));
    return responseAPI.stores;
  }

}