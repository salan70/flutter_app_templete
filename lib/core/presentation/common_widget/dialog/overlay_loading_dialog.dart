import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_overlay_dialog.dart';

/// ローディング時に表示するダイアログ。
class OverlayLoadingDialog extends StatelessWidget {
  const OverlayLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseOverlayDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoActivityIndicator(
            radius: 16,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
