import 'package:flutter/material.dart';

class EntityForeground extends StatelessWidget {
  const EntityForeground({super.key, this.children = const []});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    ));
  }
}
