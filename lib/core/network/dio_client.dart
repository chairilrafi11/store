import 'package:chairil/core/app/app.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/core_model.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @POST(Endpoint.login)
  Future<CoreModel> login();

}
