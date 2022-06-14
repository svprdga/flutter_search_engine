import 'package:flutter_search_engine/data/repository/search_repository.dart';
import 'package:flutter_search_engine/domain/search_result.dart';
import 'package:logger/logger.dart';

class SearchModel {
  final Logger _log;
  final SearchRepository _searchRepo;

  SearchModel(this._log, this._searchRepo);

  Future<List<SearchResult>> search(String criteria) async {
    try {
      final results = await _searchRepo.search(criteria);
      _log.d("Found ${results.length} results for search '$criteria'");
      return results;
    } catch (e) {
      _log.e('Error while performing the search: $e');
      rethrow;
    }
  }
}
