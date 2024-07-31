import 'package:flutter/material.dart';
import 'package:showcase/widgets/view/view.dart';

class EntityViewList<EV> extends StatelessWidget {
  const EntityViewList({
    super.key,
    required this.entityIndex,
    required this.items,
    required this.viewPageController,
    required this.entityViewItemBuilder,
  });

  final PageController viewPageController;
  final Widget Function(BuildContext context, int index, EV viewItem)
      entityViewItemBuilder;
  final List<EV> items;
  final int entityIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: viewPageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return EntityView<EV>(
            entityIndex: entityIndex,
            viewIndex: index,
            item: items[index],
            entityViewItemBuilder: entityViewItemBuilder,
          );
        },
      ),
    );
  }
}
