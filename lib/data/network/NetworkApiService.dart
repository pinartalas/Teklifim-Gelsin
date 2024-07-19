import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:teklifim_gelsin_task/data/app_exception.dart';
import 'BaseApiService.dart';

class NetworkApiService implements BaseApiService {
  Dio dio = Dio();

  @override
  Future getGetApiResponse(String url) async {
    // dynamic responseJson;

    try {
      final response = await dio.get(url).timeout(const Duration(seconds: 20));
      return returnResponse(response);
    } catch (e) {
      // Handle DioError
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          throw FetchDataException('Network request timed out');
        } else if (e.type == DioExceptionType.unknown &&
            e.error is SocketException) {
          throw NoInternetException('No internet connection');
        }
      }
      throw FetchDataException(
          'Error occurred while communicating with server');
    }
  }

  dynamic returnResponse(Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = jsonDecode(response.data);
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.data.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }
}
