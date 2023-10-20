import 'package:flutter/material.dart';
import 'package:toastification/src/widget/built_in/built_in_style.dart';

enum ToastificationStyle {
  minimal,
  fillColored,
  flatColored,
  flat,
}

enum ToastificationType {
  info,
  warning,
  success,
  error,
}

enum CloseButtonShowType {
  always('Always'),
  onHover('On Hover'),
  none('None');

  const CloseButtonShowType(this.title);

  final String title;

  @override
  String toString() => title;

  String toValueString() => '$CloseButtonShowType.$name';
}

class BuiltInContent extends StatelessWidget {
  const BuiltInContent({
    super.key,
    required this.style,
    required this.title,
    this.description,
    this.primaryColor,
    this.foregroundColor,
    this.backgroundColor,
    this.showProgressBar = false,
    this.progressBarValue,
    this.progressBarWidget,
    this.progressIndicatorTheme,
    this.showStayButton = false,
    this.stayButtonTap,
  });

  final bool? showStayButton;
  final VoidCallback? stayButtonTap;
  final BuiltInStyle style;

  final String title;

  final String? description;

  final Color? primaryColor;
  final Color? foregroundColor;
  final Color? backgroundColor;

  final bool showProgressBar;
  final double? progressBarValue;
  final Widget? progressBarWidget;

  final ProgressIndicatorThemeData? progressIndicatorTheme;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Text(
        title,
        style: style.titleTextStyle(context)?.copyWith(
              color: foregroundColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
      ),
    );

    final showColumn =
        description?.isNotEmpty == true || showProgressBar == true;

    if (showColumn) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content,
          if (description?.isNotEmpty == true) ...[
            const SizedBox(height: 6),
            Text(
              description!,
              style: style.descriptionTextStyle(context)?.copyWith(
                    color: foregroundColor?.withOpacity(.7),
                  ),
            ),
          ],
          if (showStayButton == true)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: stayButtonTap ?? () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Stay',
                      style: TextStyle(
                        color: foregroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (showProgressBar) ...[
            const SizedBox(height: 10),
            ProgressIndicatorTheme(
              data: progressIndicatorTheme ??
                  style.progressIndicatorTheme(context),
              child: progressBarWidget ??
                  LinearProgressIndicator(value: progressBarValue),
            ),
          ],
        ],
      );
    }

    return content;
  }
}
