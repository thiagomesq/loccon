import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class _ControllerProvider extends InheritedWidget {
  final dynamic controller;

  const _ControllerProvider({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ControllerScope<T extends ControllerBase> extends StatefulWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T controller) builder;
  final Function(BuildContext, T)? onAppResume;

  const ControllerScope({
    Key? key,
    required this.create,
    required this.builder,
    this.onAppResume,
  }) : super(key: key);

  static T of<T extends Object>(BuildContext context) {
    final provider =
        context.getElementForInheritedWidgetOfExactType<_ControllerProvider>();

    if (provider == null) {
      throw Exception('No controller found');
    }

    return (provider.widget as _ControllerProvider).controller;
  }

  @override
  _ControllerScopeState<T> createState() => _ControllerScopeState<T>();
}

class _ControllerScopeState<T extends ControllerBase>
    extends State<ControllerScope<T>> with WidgetsBindingObserver {
  late T controller;

  final logger = Logger('_ControllerScopeState');

  @override
  void initState() {
    super.initState();

    controller = widget.create(context);

    if (widget.onAppResume != null) {
      WidgetsBinding.instance.addObserver(this);
    }

    logger
        .info('${T.toString()} - Create controller => ${controller.hashCode}');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      logger.info('${T.toString()} - App Resume => ${controller.hashCode}');
      widget.onAppResume?.call(context, controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ControllerProvider(
      controller: controller,
      child: Builder(
        builder: (context) {
          return widget.builder(context, controller);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    logger
        .info('${T.toString()} - Dispose Controller => ${controller.hashCode}');

    WidgetsBinding.instance.removeObserver(this);
    controller.onDispose();
  }
}
