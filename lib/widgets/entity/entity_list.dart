import 'package:flutter/material.dart';
import 'package:showcase/models/entity_config.dart';
import 'package:showcase/models/showcase_item.dart';
import 'package:showcase/widgets/entity/entity.dart';

class EntityList<E, EV> extends StatefulWidget {
  const EntityList({
    super.key,
    this.activedIndex = 0,
    required this.entityItems,
    required this.config,
  });

  final int activedIndex;
  final List<EntityItem<E, EV>> entityItems;
  final EntityConfig<E, EV> config;

  @override
  State<EntityList<E, EV>> createState() => _EntityListState<E, EV>();
}

class _EntityListState<E, EV> extends State<EntityList<E, EV>> {
  late PageController _entityPageController;

  @override
  void initState() {
    super.initState();
    _entityPageController = PageController(
      initialPage: widget.activedIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _entityPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _entityPageController,
          itemCount: widget.entityItems.length,
          itemBuilder: (context, index) {
            return Entity<E, EV>(
              entityIndex: index,
              entityItem: widget.entityItems[index],
              entityNumItems: widget.entityItems.length,
              entityItemBuilder: widget.config.entityItemBuilder,
              entityViewItemBuilder: widget.config.entityViewItemBuilder,
              viewDuration: widget.config.viewDuration,
              playButtonEnabled: widget.config.playButtonEnabled,
              entityPageController: _entityPageController,
            );
          },
        ),
      ),
    );
  }
}
