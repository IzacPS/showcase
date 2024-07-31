import 'package:flutter/widgets.dart';

class EntityConfig<E, EV> {
  EntityConfig({
    required this.entityViewItemBuilder,
    this.entityItemBuilder,
    this.viewDuration = const Duration(seconds: 5),
    this.playButtonEnabled = true,
  });

  final Widget Function(BuildContext context, int index, E entityItem)?
      entityItemBuilder;
  final Widget Function(BuildContext context, int index, EV viewItem)
      entityViewItemBuilder;
  final Duration viewDuration;
  final bool playButtonEnabled;
}
