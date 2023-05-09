import 'package:dio/dio.dart';

import '../../global/constants.dart';
import '../../storage/storage.dart';

class AuthInterceptor extends Interceptor {
  final Storage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accesToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //
  //   super.onError(err, handler);
  // }
}
