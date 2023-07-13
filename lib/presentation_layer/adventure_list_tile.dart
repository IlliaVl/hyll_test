import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../data_layer/models/adventures.dart';

class AdventureTile extends StatelessWidget {
  final Adventure adventure;

  VideoPlayerController? controller;

  AdventureTile({
    Key? key,
    required this.adventure,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: controller?.value.isInitialized ?? false
          ? AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: VideoPlayer(controller!),
            )
          : ListTile(
              title: Text(adventure.title ?? '--'),
            ),
    );
  }
}
