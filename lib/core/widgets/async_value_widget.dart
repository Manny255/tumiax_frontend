import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'error_state.dart';
import 'shimmer_loader.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) onData;
  final Widget? onLoading;
  final Widget Function(Object, StackTrace)? onError;
  final VoidCallback? onRetry;
  final double? loadingHeight;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.onData,
    this.onLoading,
    this.onError,
    this.onRetry,
    this.loadingHeight,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: onData,
      loading: () =>
          onLoading ??
          (loadingHeight != null
              ? ShimmerLoader(height: loadingHeight!)
              : const Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) {
        if (onError != null) {
          return onError!(error, stackTrace);
        }
        return ErrorState(message: error.toString(), onRetry: onRetry ?? () {});
      },
    );
  }
}
