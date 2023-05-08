import 'package:flutter/material.dart';
import 'package:my_great_app/uikit/uikit.dart';
import 'package:provider/provider.dart';

import 'features/router/router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModeProvider(),
      child: Consumer<ThemeModeProvider>(builder: (context, provider, _) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          themeMode: provider.mode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          title: 'My app',
        );
      }),
    );
  }
}
