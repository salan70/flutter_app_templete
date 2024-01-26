import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'util/res/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'テンプレアプリ', // TODO(toda): アプリ名を設定する。
      theme: getAppTheme(),
      darkTheme: getAppThemeDark(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // DevicePreview 関連の設定。
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const Scaffold(
        body: Center(
          child: Text('テンプレアプリ'), // TODO(toda): アプリ名を設定する。
        ),
      ),
    );
  }
}
