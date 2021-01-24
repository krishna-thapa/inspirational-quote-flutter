import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseService {
  Dio _dio;

  Dio get dio => _dio;

  BaseService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: "http://localhost:9000/");
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }
}