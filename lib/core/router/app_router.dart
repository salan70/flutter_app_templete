import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/page/setting_page.dart';
import '../presentation/page/top_page.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) => AppRouter(ref);

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter(this.ref);

  final Ref ref;

  @override
  List<AdaptiveRoute> get routes => [
        // AdaptiveRoute(
        //   path: '/welcome',
        //   page: WelcomeRoute.page,
        // ),
        AdaptiveRoute(
          path: '/',
          page: TopRoute.page,
        ),
        AdaptiveRoute(
          path: '/setting',
          page: SettingRoute.page,
        ),
      ];
}
