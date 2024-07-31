// import 'package:flutter/material.dart';
//
// class PlayPauseButton extends StatefulWidget {
//   const PlayPauseButton({
//     super.key,
//     //required this.onPressed,
//     required this.animationController,
//   });
//
//   // final void Function(bool isPlaying) onPressed;
//   final AnimationController animationController;
//
//   @override
//   State<PlayPauseButton> createState() => _PlayPauseButtonState();
// }
//
// class _PlayPauseButtonState extends State<PlayPauseButton> {
//   bool _isPlaying = false;
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(54),
//       child: IconButton.outlined(
//         onPressed: () {
//           setState(() {
//             _isPlaying = !_isPlaying;
//           });
//           // widget.onPressed(_isPlaying);
//         },
//         icon: Icon((_isPlaying) ? Icons.pause : Icons.play_arrow),
//       ),
//     );
//   }
// }
