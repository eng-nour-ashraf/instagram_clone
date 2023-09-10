import 'dart:io';

import 'package:dio/dio.dart';

import 'api_urls.dart';
import 'network_config.dart';

class ApiController {
  NetworkConfig? _networkConfig;

  ApiController() {
    _networkConfig = NetworkConfig();
  }

  void onClearCash() {
    _networkConfig!.clearCacheOptions();
  }

  // Login
  Future<Response> onLogin(
      {required String phone,
      required String password,
      required String currentLocal,
      required String fcmToken}) {
    var header = <String, String>{'language': currentLocal};
    var body = <String, dynamic>{
      'phone': phone,
      'password': password,
      'fcm_token': fcmToken,
    };

    return _networkConfig!.post(
        url: ApiEndPoints.loginUrl, body: body, headers: header, query: {},);
  }


}
