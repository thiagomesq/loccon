import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dumpin/ui/shared/lc_error.dart';
import 'package:mobx/mobx.dart';

class LCFetch<T> extends StatelessWidget {
  final ObservableFuture<T> future;
  final Widget child;
  final VoidCallback? onReload;
  final Widget? loaderWidget;
  final Widget? emptyChild;
  final Widget Function(BuildContext, T)? builder;

  const LCFetch({
    required this.future,
    required this.child,
    this.onReload,
    this.loaderWidget,
    this.emptyChild,
    this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (future.status) {
        case FutureStatus.pending:
          return loaderWidget ??
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
        case FutureStatus.rejected:
          return LCError(
            error: future.error,
            onReload: onReload,
          );
        case FutureStatus.fulfilled:
          if (future.value == null) {
            return emptyChild ?? child;
          }
          if (builder != null) {
            return builder!.call(context, future.value as T);
          }
          return child;
      }
    });
  }
}
