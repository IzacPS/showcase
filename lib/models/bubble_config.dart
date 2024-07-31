import 'dart:math';

import 'package:flutter/material.dart';

class BubbleConfig<B> {
  BubbleConfig({
    required this.statusBuilder,
    required this.avatarBuilder,
    required this.descriptionBuilder,
    this.emptyListFallbackBuilder,
    double size = 92,
    double height = 54,
  })  : _size = max(size, 24),
        _height = max(height, 54);

  final double _size;
  final double _height;

  final Color Function(BuildContext context, int index, B bubbleItem)
      statusBuilder;
  final DecorationImage? Function(BuildContext context, int index, B bubbleItem)
      avatarBuilder;
  final Widget Function(BuildContext context, int index, B bubbleItem)
      descriptionBuilder;
  final Widget Function(BuildContext context)? emptyListFallbackBuilder;

  double get size => _size;
  double get height => _height;
}
