import 'package:dio/dio.dart';

import '../../base/base_model.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: 'https://fakerapi.it/api/v1');
    _dio = Dio(baseOptions);
  }

  Dio _dio = Dio();

  Future<dynamic> dioGet<T extends BaseModel>(String path,
      {T? model, Options? options, Map<String, dynamic>? map}) async {
    final response = await _dio.get(path,
        options: options ?? Options(), queryParameters: map ?? {});
    switch (response.statusCode) {
      case 200:
        final responseBody = response.data;

        if ((responseBody is List) && model != null) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if ((responseBody is Map) && model != null) {
          return model.fromJson(responseBody as Map<String, dynamic>);
        } else {
          return responseBody;
        }
      default:
    }
  }
}
