import 'package:flutter/material.dart';
import 'package:dumpin/ui/shared/lc_button.dart';
import 'package:dumpin/ui/shared/lc_future_executor.dart';

class LCFutureButton<T> extends StatelessWidget {
  final Widget? icon;
  final double? height;
  final double? width;
  final Widget child;
  final bool isOutlined;
  final bool isTextButton;
  final bool isIconButton;
  final bool isValid;
  final String? confirmText;
  final String? confirmationText;
  final String? cancelText;
  final Future<T> Function(BuildContext) futureBuilder;
  final Function(BuildContext, T)? onOk;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const LCFutureButton({
    super.key,
    required this.futureBuilder,
    required this.child,
    this.icon,
    this.isOutlined = false,
    this.isTextButton = false,
    this.isIconButton = false,
    this.isValid = true,
    this.height,
    this.width,
    this.onOk,
    this.confirmText,
    this.confirmationText,
    this.cancelText,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LCFutureExecutor<T>(
      futureBuilder: futureBuilder,
      confirmDialogContent: confirmText,
      confirmationText: confirmationText,
      cancelText: cancelText,
      builder: (context, loading, onPressed) {
        return LCButton(
          isValid: isValid,
          height: height,
          isTextButton: isTextButton,
          isIconButton: isIconButton,
          width: width,
          isOutlined: isOutlined,
          onPressed: onPressed,
          isLoading: loading,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          child: child,
        );
      },
      onOk: onOk,
    );
  }
}
