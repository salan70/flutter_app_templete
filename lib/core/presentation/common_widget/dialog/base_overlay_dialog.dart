import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 画面操作や端末のバックキーを受け付けないローディングダイアログ。
///
/// Dialog 系の Widget を使用していないが、
/// 透明の Widget で囲い、ダイアログ表示を模している。
class BaseOverlayDialog extends ConsumerWidget {
  const BaseOverlayDialog({super.key, required this.child});

  /// ダイアログの中身の Widget.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
