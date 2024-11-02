import 'package:flutter/material.dart';

class BubbleAvatar<B> extends StatelessWidget {
  const BubbleAvatar({
    super.key,
    required this.index,
    required this.item,
    required this.size,
    required this.statusBuilder,
    required this.avatarBuilder,
  });

  final Color Function(BuildContext context, int index, B bubbleItem)
      statusBuilder;
  final Widget Function(BuildContext context, int index, B bubbleItem)
      avatarBuilder;
  final B item;
  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: statusBuilder(context, index, item), width: 3),
      ),
      child: avatarBuilder(context, index, item),
    );
  }
}
