import 'package:flutter/material.dart';

class EntityView<EV> extends StatelessWidget {
  const EntityView({
    super.key,
    required this.entityIndex,
    required this.viewIndex,
    required this.item,
    required this.entityViewItemBuilder,
  });

  final int entityIndex;
  final int viewIndex;
  final EV item;
  final Widget Function(BuildContext context, int index, EV viewItem)
      entityViewItemBuilder;

  @override
  Widget build(BuildContext context) {
    return entityViewItemBuilder(context, viewIndex, item);
  }
}
