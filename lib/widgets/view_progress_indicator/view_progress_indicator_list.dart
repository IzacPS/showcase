import 'package:flutter/material.dart';
import 'package:showcase/widgets/view_progress_indicator/indicator_controller.dart';
import 'package:showcase/widgets/view_progress_indicator/view_progress_indicator.dart';

class ViewProgressIndicatorList extends StatelessWidget {
  const ViewProgressIndicatorList({
    super.key,
    required this.itemCount,
    required this.duration,
    required this.indicatorController,
    required this.animationController,
  });

  final int itemCount;
  final Duration duration;
  final IndicatorController indicatorController;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: indicatorController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < itemCount; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: (i == indicatorController.currentIndicator)
                        ? ViewProgressIndicator(
                            animationController: animationController,
                          )
                        : const StaticViewProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
