import 'package:flutter/material.dart';
import 'package:showcase/widgets/bubble/bubble.dart';

class BubbleList<B> extends StatelessWidget {
  const BubbleList.builder({
    super.key,
    required this.items,
    required this.bubbleItemBuilder,
    this.emptyListFallbackBuilder,
  });

  final Bubble<B> Function(BuildContext context, int index, B bubbleItem)
      bubbleItemBuilder;
  final Widget Function(BuildContext context)? emptyListFallbackBuilder;
  final List<B> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: 148,
        child: (items.isNotEmpty)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    this.bubbleItemBuilder(context, index, items[index]),
              )
            : (emptyListFallbackBuilder != null)
                ? emptyListFallbackBuilder!(context)
                : Container(),
        //: noEntitiesBuilder(),
      ),
    );
  }
}
