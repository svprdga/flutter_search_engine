import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_engine/data.dart';
import 'package:flutter_search_engine/data/mapper.dart';
import 'package:flutter_search_engine/data/network/client/api_client.dart';
import 'package:flutter_search_engine/data/repository/search_repository.dart';
import 'package:flutter_search_engine/presentation/main/main_screen.dart';
import 'package:flutter_search_engine/presentation/search/search_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: MainScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
      GoRoute(
        path: '${SearchScreen.routeName}/:criteria',
        builder: (BuildContext context, GoRouterState state) =>
            SearchScreen(criteria: state.params['criteria']!),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Logger>(
          create: (_) => Logger(
            printer: PrettyPrinter(),
            level: kDebugMode ? Level.verbose : Level.nothing,
          ),
        ),
        Provider<SearchRepository>(
          create: (_) => SearchRepository(
            apiClient: ApiClient(
              baseUrl: 'google-search3.p.rapidapi.com/api/v1',
              apiKey: apiKey,
            ),
            mapper: Mapper(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flugle',
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
