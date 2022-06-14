import 'package:json_annotation/json_annotation.dart';

part 'search_result_entity.g.dart';

@JsonSerializable()
class SearchResultResponse {
  final List<SearchResultEntity> results;

  SearchResultResponse({required this.results});

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseFromJson(json);
}

@JsonSerializable()
class SearchResultEntity {
  final String title;
  final String description;
  final String link;

  SearchResultEntity({
    required this.title,
    required this.description,
    required this.link,
  });

  factory SearchResultEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchResultEntityFromJson(json);
}
