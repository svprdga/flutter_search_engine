import 'package:flutter/material.dart';
import 'package:flutter_search_engine/presentation/search/search_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flugle',
      home: SearchScreen(),
    );
  }
}
