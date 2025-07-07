import 'package:flutter/material.dart';

/// Padding Height (Vertical Space) & Padding Width (Horizontal Space) helper
extension PaddingMarginExtensions on num {
  /// Vertical space (Height)
  SizedBox get ph => SizedBox(height: toDouble());

  /// Horizontal space (Width)
  SizedBox get pw => SizedBox(width: toDouble());
}

/// EdgeInsets Helper
extension EdgeInsetsExtensions on num {
  /// Padding all sides
  EdgeInsets get pAll => EdgeInsets.all(toDouble());

  /// Padding only vertical (top & bottom)
  EdgeInsets get pH => EdgeInsets.symmetric(vertical: toDouble());

  /// Padding only horizontal (left & right)
  EdgeInsets get pW => EdgeInsets.symmetric(horizontal: toDouble());
}
