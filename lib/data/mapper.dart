import 'package:flutter_search_engine/data/network/entity/search_result_entity.dart';
import 'package:flutter_search_engine/domain/search_result.dart';

class MapperException<From, To> implements Exception {
  final String message;

  const MapperException(this.message);

  @override
  String toString() {
    return 'Error when mapping class $From to $To: $message}';
  }
}

class Mapper {
  SearchResult toSearchResult(SearchResultEntity entity) {
    try {
      return SearchResult(
        title: entity.title,
        description: entity.description,
        link: entity.link,
      );
    } catch (e) {
      throw MapperException<SearchResultEntity, SearchResult>(e.toString());
    }
  }

  List<SearchResult> toSearchResults(List<SearchResultEntity> entities) {
    final List<SearchResult> results = [];

    for (final entity in entities) {
      results.add(toSearchResult(entity));
    }

    return results;
  }
}
