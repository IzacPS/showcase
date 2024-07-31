import 'package:flutter/material.dart';
import 'package:showcase/models/bubble_config.dart';
import 'package:showcase/widgets/bubble/bubble_avatar.dart';
import 'package:showcase/widgets/bubble/bubble_description.dart';

class Bubble<B> extends StatelessWidget {
  const Bubble({
    super.key,
    required this.index,
    required this.item,
    required this.onTap,
    required this.config,
  });

  final int index;
  final B item;
  final void Function(int index) onTap;
  final BubbleConfig<B> config;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: config.size + 56,
        width: config.size + 8,
        child: Column(
          children: [
            BubbleAvatar(
                index: index,
                item: item,
                size: config.size,
                statusBuilder: config.statusBuilder,
                avatarBuilder: config.avatarBuilder),
            BubbleDescription(
                item: item,
                index: index,
                height: config.height,
                descriptionBuilder: config.descriptionBuilder),
          ],
        ),
      ),
    );
  }
}
