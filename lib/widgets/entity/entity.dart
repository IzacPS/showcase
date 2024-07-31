import 'package:flutter/material.dart';
import 'package:showcase/models/showcase_item.dart';
import 'package:showcase/widgets/entity/entity_foreground.dart';
import 'package:showcase/widgets/view/view_list.dart';
import 'package:showcase/widgets/view_progress_indicator/indicator_controller.dart';
import 'package:showcase/widgets/view_progress_indicator/view_progress_indicator_list.dart';

class Entity<E, EV> extends StatefulWidget {
  const Entity({
    super.key,
    required this.entityIndex,
    required this.entityItem,
    required this.entityNumItems,
    required this.entityItemBuilder,
    required this.entityViewItemBuilder,
    required this.viewDuration,
    required this.playButtonEnabled,
    required this.entityPageController,
  });

  final Duration viewDuration;
  final Widget Function(BuildContext context, int index, E entityItem)?
      entityItemBuilder;
  final Widget Function(BuildContext context, int index, EV viewItem)
      entityViewItemBuilder;
  final EntityItem<E, EV> entityItem;
  final bool playButtonEnabled;
  final int entityIndex;
  final int entityNumItems;
  final PageController entityPageController;

  @override
  State<Entity<E, EV>> createState() => _EntityState<E, EV>();
}

class _EntityState<E, EV> extends State<Entity<E, EV>>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late PageController _viewPageController;
  late IndicatorController _indicatorController;
  late final AnimationController _animationController;

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.reset();
      _animationController.forward();
      _indicatorController.nextIndicator();

      if (_viewPageController.page!.round() ==
          widget.entityItem.entityViewItems.length - 1) {
        if (widget.entityPageController.page!.round() ==
            widget.entityNumItems - 1) {
          Navigator.pop(context);
          return;
        }
        widget.entityPageController.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
      _viewPageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _viewPageController = PageController(
      initialPage: 0,
    );
    _indicatorController = IndicatorController(
      numItems: widget.entityItem.entityViewItems.length,
      currentIndicator: 0,
    );
    _animationController =
        AnimationController(duration: widget.viewDuration, vsync: this)
          ..addStatusListener(_animationStatusListener)
          ..forward();
  }

  @override
  void dispose() {
    _viewPageController.dispose();
    _indicatorController.dispose();
    _animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _animationController.stop();
    } else if (state == AppLifecycleState.resumed) {
      _animationController.forward();
    }
  }

  void _onTapDownGesture(TapDownDetails details) {
    double width = MediaQuery.of(context).size.width;
    if (details.globalPosition.dx < width / 2) {
      _animationController.reset();
      _animationController.forward();
      _indicatorController.previousIndicator();
      if (_viewPageController.page!.round() == 0) {
        widget.entityPageController.previousPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);
      }

      _viewPageController.previousPage(
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);

      return;
    }
    if (details.globalPosition.dx >= width / 2) {
      _animationController.reset();
      _animationController.forward();
      _indicatorController.nextIndicator();
      if (_viewPageController.page!.round() ==
          widget.entityItem.entityViewItems.length - 1) {
        if (widget.entityPageController.page!.round() ==
            widget.entityNumItems - 1) {
          Navigator.pop(context);
          return;
        }
        widget.entityPageController.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);
      }
      _viewPageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDownGesture,
      child: Stack(
        children: [
          EntityViewList<EV>(
            entityIndex: widget.entityIndex,
            items: widget.entityItem.entityViewItems,
            viewPageController: _viewPageController,
            entityViewItemBuilder: widget.entityViewItemBuilder,
          ),
          EntityForeground(
            children: [
              ViewProgressIndicatorList(
                itemCount: widget.entityItem.entityViewItems.length,
                duration: widget.viewDuration,
                indicatorController: _indicatorController,
                animationController: _animationController,
              ),
              if (widget.entityItemBuilder != null)
                Flexible(
                    child: widget.entityItemBuilder!(
                        context, widget.entityIndex, widget.entityItem.item)),
              // PlayPauseButton(
              //   animationController: _animationController,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
