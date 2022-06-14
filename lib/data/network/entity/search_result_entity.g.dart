// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultResponse _$SearchResultResponseFromJson(
        Map<String, dynamic> json) =>
    SearchResultResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResultEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultResponseToJson(
        SearchResultResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SearchResultEntity _$SearchResultEntityFromJson(Map<String, dynamic> json) =>
    SearchResultEntity(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$SearchResultEntityToJson(SearchResultEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
    };
