class ShowcaseItem<B, E, EV> {
  ShowcaseItem({
    required this.bubbleItem,
    required this.entityItem,
  });
  final B bubbleItem;
  final EntityItem<E, EV> entityItem;
}

class EntityItem<E, EV> {
  final E item;
  final List<EV> entityViewItems;

  EntityItem({
    required this.item,
    required this.entityViewItems,
  });
}
