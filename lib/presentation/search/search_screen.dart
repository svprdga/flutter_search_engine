import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String criteria;

  const SearchScreen({
    super.key,
    required this.criteria,
  });

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(criteria),
      ),
    );
  }
}
