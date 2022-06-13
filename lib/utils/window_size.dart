import 'dart:ui';

class WindowSize {
  static double pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  static Size physicalScreenSize = window.physicalSize;
  static double physicalWidth = physicalScreenSize.width;
  static double physicalHeight = physicalScreenSize.height;

  //Size in logical pixels
  static Size logicalScreenSize = window.physicalSize / pixelRatio;
  static double logicalWidth = logicalScreenSize.width;
  static double logicalHeight = logicalScreenSize.height;

  //Padding in physical pixels
  static WindowPadding padding = window.padding;

  //Safe area paddings in logical pixels
  static double paddingLeft = window.padding.left / window.devicePixelRatio;
  static double paddingRight = window.padding.right / window.devicePixelRatio;
  static double paddingTop = window.padding.top / window.devicePixelRatio;
  static double paddingBottom = window.padding.bottom / window.devicePixelRatio;

  //Safe area in logical pixels
  static double safeWidth = logicalWidth - paddingLeft - paddingRight;
  static double safeHeight = logicalHeight - paddingTop - paddingBottom;
}
