import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

/// Used by [AppColors] of app and web
class AppColors {
  static const colorPrimary = Color(0xFF0a0b0b);
  static const color7E7E7E = Color(0xFF7e7e7e);
  static Color colorDefault =
      FlavorConfig.instance.variables["color_default"] ??
          const Color(0xff00ff00);
  static Color colorOther =
      FlavorConfig.instance.variables["color_other"] ?? const Color(0xffff0000);
}
