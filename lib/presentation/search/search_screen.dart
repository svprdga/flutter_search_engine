import 'package:flutter/material.dart';
import 'package:flutter_search_engine/data/repository/search_repository.dart';
import 'package:flutter_search_engine/domain/search_result.dart';
import 'package:flutter_search_engine/presentation/search/search_model.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final String criteria;

  const SearchScreen({
    super.key,
    required this.criteria,
  });

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    final _model = SearchModel(
      Provider.of<Logger>(context, listen: false),
      Provider.of<SearchRepository>(context, listen: false),
    );

    return Scaffold(
      body: FutureBuilder<List<SearchResult>>(
        future: _model.search(criteria),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _SearchResults(snapshot.data!);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<SearchResult> results;

  const _SearchResults(this.results);

  @override
  Widget build(BuildContext context) {
    final List<ListTile> tiles = [];

    for (final result in results) {
      tiles.add(
        ListTile(
          title: Text(result.title),
          subtitle: Text(result.description),
        ),
      );
    }

    return ListView(
      children: tiles,
    );
  }
}
