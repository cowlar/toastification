import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toastification/toastification.dart';

part 'toast_detail_ui_state.freezed.dart';

@freezed
class ToastDetail with _$ToastDetail {
  factory ToastDetail({
    ToastificationType? type,
    @Default(ToastificationStyle.flat) ToastificationStyle style,
    // placement
    @Default(Alignment.topRight) AlignmentGeometry alignment,
    @Default('Toast Title') String title,
    @Default('Toast Description') String description,
    Widget? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? iconColor,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    TextDirection? direction,
    Duration? autoCloseDuration,
    Duration? animationDuration,
    VoidCallback? onCloseTap,
    bool? showProgressBar,
    bool? showCloseButton,
    bool? closeOnClick,
    bool? dragToClose,
    bool? pauseOnHover,
  }) = _ToastDetail;

}
