import 'package:flutter/material.dart';
import 'package:showcase/models/bubble_config.dart';
import 'package:showcase/models/entity_config.dart';
import 'package:showcase/models/showcase_item.dart';
import 'package:showcase/widgets/bubble/bubble.dart';
import 'package:showcase/widgets/bubble/bubble_list.dart';
import 'package:showcase/widgets/entity/entity_list.dart';

class Showcase<B, E, EV> extends StatelessWidget {
  const Showcase({
    super.key,
    required this.items,
    required this.bubbleConfig,
    required this.entityConfig,
  });

  final List<ShowcaseItem<B, E, EV>> items;
  final BubbleConfig<B> bubbleConfig;
  final EntityConfig<E, EV> entityConfig;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: bubbleConfig.size + 56,
        child: BubbleList<B>.builder(
          items: items.map((e) => e.bubbleItem).toList(),
          bubbleItemBuilder: (context, index, bubbleItem) {
            return Bubble<B>(
              index: index,
              item: bubbleItem,
              config: bubbleConfig,
              onTap: (bubbleIndex) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntityList<E, EV>(
                      activedIndex: bubbleIndex,
                      entityItems: items.map((e) => e.entityItem).toList(),
                      config: entityConfig,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
