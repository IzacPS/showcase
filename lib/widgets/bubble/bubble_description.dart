import 'package:flutter/material.dart';

class BubbleDescription<B> extends StatelessWidget {
  const BubbleDescription({
    super.key,
    required this.item,
    required this.index,
    required this.height,
    required this.descriptionBuilder,
  });

  final B item;
  final int index;
  final double height;
  final Widget Function(BuildContext context, int index, B bubbleItem)
      descriptionBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: descriptionBuilder(context, index, item),
      ),
    );
  }
}
