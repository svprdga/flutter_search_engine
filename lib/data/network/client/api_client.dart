import 'package:dio/dio.dart';
import 'package:flutter_search_engine/data/network/entity/search_result_entity.dart';

class KoException implements Exception {
  final int statusCode;
  final String? message;

  const KoException({required this.statusCode, this.message});

  @override
  String toString() {
    return 'KoException: statusCode: $statusCode, message: ${message ?? 'No message specified'}';
  }
}

class ApiClient {
  final String baseUrl;
  final String apiKey;

  ApiClient({
    required this.baseUrl,
    required this.apiKey,
  });

  Future<SearchResultResponse> search(String criteria) async {
    try {
      final endpoint = 'https://$baseUrl/search/q=$criteria';

      final response = await Dio().get(
        endpoint,
        options: Options(
          headers: {
            'X-RapidAPI-Host': baseUrl,
            'X-RapidAPI-Key': apiKey,
          },
        ),
      );

      if (response.data != null) {
        final data = response.data;

        return SearchResultResponse.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Could not parse response.');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw KoException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }
}
