import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_great_app/features/home/presentation/home_screen.dart';
import 'package:my_great_app/features/quiz/presentation/screen/quiz_list_screen.dart';
import 'package:my_great_app/features/quiz/presentation/screen/quiz_root_screen.dart';
import 'package:my_great_app/features/quiz/presentation/screen/quiz_screen.dart';
import 'package:my_great_app/features/settings/presentation/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(page: QuizRootRoute.page, path: 'quiz', children: [
              AutoRoute(path: '', page: QuizListRoute.page),
              AutoRoute(path: ':id', page: QuizRoute.page),
            ]),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
      ];
}

final appRouter = AppRouter();
