import 'package:flutter/material.dart';

class ViewProgressIndicator extends AnimatedWidget {
  const ViewProgressIndicator(
      {super.key, required AnimationController animationController})
      : super(listenable: animationController);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 3,
      backgroundColor: Colors.grey,
      valueColor: const AlwaysStoppedAnimation(
        Colors.white,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      value: _progress.value,
    );
  }
}

class StaticViewProgressIndicator extends StatelessWidget {
  const StaticViewProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
