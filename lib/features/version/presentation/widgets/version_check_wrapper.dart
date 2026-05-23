import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../version/providers/version_providers.dart';
import '../../../version/presentation/widgets/update_dialog.dart';

class VersionCheckWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const VersionCheckWrapper({super.key, required this.child});

  @override
  ConsumerState<VersionCheckWrapper> createState() =>
      _VersionCheckWrapperState();
}

class _VersionCheckWrapperState extends ConsumerState<VersionCheckWrapper> {
  bool _dialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkVersion();
  }

  Future<void> _checkVersion() async {
    if (_dialogShown) return;

    try {
      final result = await ref.read(versionCheckProvider.future);

      if (result.isForceUpdate) {
        _dialogShown = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          UpdateDialog.show(
            context: context,
            version: result.latestVersion,
            isForceUpdate: true,
            currentVersion: result.currentVersion,
          );
        });
      } else if (result.isOptionalUpdate) {
        _dialogShown = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          UpdateDialog.show(
            context: context,
            version: result.latestVersion,
            isForceUpdate: false,
            currentVersion: result.currentVersion,
          );
        });
      }
    } catch (_) {
      // ignore errors, just let user continue
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
