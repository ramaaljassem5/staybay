import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  final Color brandColor;
  final Color danger;

  const MyColors({required this.brandColor, required this.danger});

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
