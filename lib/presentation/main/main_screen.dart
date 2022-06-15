import 'package:flutter/material.dart';
import 'package:flutter_search_engine/presentation/main/main_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(),
      child: Scaffold(
        body: Center(
          child: _SearchWidget(),
        ),
      ),
    );
  }
}

class _SearchWidget extends StatefulWidget {
  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<_SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, child) => ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 584.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text(
                'Flugle',
                style: TextStyle(
                  fontSize: 88.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: MouseRegion(
                onEnter: (_) => model.isMouseOver = true,
                onExit: (_) => model.isMouseOver = false,
                child: Focus(
                  onFocusChange: (bool hasFocus) => model.hasFocus = hasFocus,
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: model.searchQuery != null &&
                              model.searchQuery!.isNotEmpty
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                model.searchQuery = null;
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: _isSearch(model),
                    ),
                    onChanged: (String? value) => model.searchQuery = value,
                    onFieldSubmitted: model.searchQuery != null &&
                            model.searchQuery!.isNotEmpty
                        ? (_) => _submit(context)
                        : null,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed:
                      model.searchQuery != null && model.searchQuery!.isNotEmpty
                          ? () => _submit(context)
                          : null,
                  child: const Text(
                    'Search on Flugle',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isSearch(MainModel model) => model.isMouseOver || model.hasFocus;

  void _submit(BuildContext context) {
    context.go(
      '/search/${_searchController.text}',
    );
  }
}
