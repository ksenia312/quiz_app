import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_great_app/uikit/theme.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'SETTINGS',
            style: TextStyle(fontFamily: 'PressStart'),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Consumer<ThemeModeProvider>(
              builder: (context, provider, _) {
                return SwitchListTile(
                  value: provider.isDark,
                  title: const Text('Темная тема'),
                  onChanged: (value) {
                    provider.setIsDark(value);
                  },
                );
              },
            ),
          ),
        ));
  }
}
