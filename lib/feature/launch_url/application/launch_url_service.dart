import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launch_url_service.g.dart';

@riverpod
LaunchUrlService launchUrlService(LaunchUrlServiceRef _) => LaunchUrlService();

/// URL 起動を行うサービスクラス。
class LaunchUrlService {
  /// アプリ内で URL を起動する。
  Future<void> launchUrlInApp(String url) async {
    await _launchUrl(url, LaunchMode.inAppWebView);
  }

  /// 外部アプリ（ブラウザを想定）で URL を起動する。
  Future<void> launchUrlInBrowser(String url) async {
    await _launchUrl(url, LaunchMode.externalApplication);
  }

  /// [url] を [mode] で起動する。
  Future<void> _launchUrl(String url, LaunchMode mode) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode);
      return;
    }
    throw Exception('URL を起動できませんでした。 url: $url, mode: $mode');
  }
}
