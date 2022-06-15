import 'package:flutter/material.dart';
import 'package:flutter_search_engine/data/repository/search_repository.dart';
import 'package:flutter_search_engine/domain/search_result.dart';
import 'package:flutter_search_engine/presentation/search/search_model.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
            return const LinearProgressIndicator();
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
    final List<Widget> widgets = [];

    for (final result in results) {
      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 8.0, bottom: 6.0),
          child: Text(result.link),
        ),
      );

      widgets.add(
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () async {
              final uri = Uri.parse(result.link);
              if (await canLaunchUrl(uri)) {
                launchUrl(uri);
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text(
              result.title,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      );

      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 30.0),
          child: Text(result.description),
        ),
      );
    }

    return ListView(
      children: widgets,
    );
  }
}
