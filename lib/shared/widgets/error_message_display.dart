import 'package:flutter/material.dart';

/// 统一的错误信息显示组件
/// 遵循项目规则，使用SelectableText.rich显示错误，不使用SnackBars
class ErrorMessageDisplay extends StatelessWidget {
  final String message;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  const ErrorMessageDisplay({
    super.key,
    required this.message,
    this.color,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: (color ?? Theme.of(context).colorScheme.error).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: color ?? Theme.of(context).colorScheme.error,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: color ?? Theme.of(context).colorScheme.error,
            size: 20.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: SelectableText.rich(
              TextSpan(
                text: message,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: color ?? Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 成功信息显示组件
class SuccessMessageDisplay extends StatelessWidget {
  final String message;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  const SuccessMessageDisplay({
    super.key,
    required this.message,
    this.color,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final successColor = color ?? Colors.green;

    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: successColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: successColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: successColor,
            size: 20.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: SelectableText.rich(
              TextSpan(
                text: message,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: successColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 信息显示组件
class InfoMessageDisplay extends StatelessWidget {
  final String message;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  const InfoMessageDisplay({
    super.key,
    required this.message,
    this.color,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final infoColor = color ?? Colors.blue;

    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: infoColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: infoColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: infoColor,
            size: 20.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: SelectableText.rich(
              TextSpan(
                text: message,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: infoColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
