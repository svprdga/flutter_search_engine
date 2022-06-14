import 'package:flutter_search_engine/data/mapper.dart';
import 'package:flutter_search_engine/data/network/client/api_client.dart';
import 'package:flutter_search_engine/domain/search_result.dart';

class SearchRepository {
  final ApiClient apiClient;
  final Mapper mapper;

  SearchRepository({
    required this.apiClient,
    required this.mapper,
  });

  Future<List<SearchResult>> search(String criteria) async {
    final response = await apiClient.search(criteria);
    return mapper.toSearchResults(response.results);
  }
}
