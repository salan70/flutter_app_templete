import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/res/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'テンプレアプリ', // TODO(toda): アプリ名を設定

      theme: getAppTheme(),
      darkTheme: getAppThemeDark(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
    );
  }
}
