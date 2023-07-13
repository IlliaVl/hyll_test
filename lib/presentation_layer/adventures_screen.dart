import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:untitled/data_layer/models/adventures.dart';
import 'package:video_player/video_player.dart';

import '../business_layer/cubits/adventures_cubit.dart';
import '../business_layer/cubits/adventures_state.dart';
import 'video_widget.dart';

/// Screen for displaying list of adventure objects.
/// Depends on [AdventuresCubit] which state store all the list of fetched objects.
class AdventuresScreen extends StatefulWidget {
  /// Creates new [AdventuresScreen].
  const AdventuresScreen({Key? key}) : super(key: key);

  @override
  State<AdventuresScreen> createState() => _AdventuresScreenState();
}

class _AdventuresScreenState extends State<AdventuresScreen> {
  VideoPlayerController? _controller;

  Map<int, VideoPlayerController> viewControllers = {};

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdventuresCubit>();

    return BlocListener<AdventuresCubit, AdventureState>(
      listenWhen: (previous, current) => !current.busy && previous.busy,
      listener: (context, state) {
        if (state.error != AdventureStateErrors.none) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong. Try later, please.'),
            ),
          );
        } else {
          for (var i = 0; i < (state.feed!.adventures?.length ?? 0); ++i) {
            final adventure = state.feed!.adventures![i];
            final content = adventure.contents?.firstWhere(
              (element) => element.contentType == ContentType.video,
            );
            if (content?.contentUrl?.isNotEmpty ?? false) {
              viewControllers[i] = VideoPlayerController.networkUrl(
                Uri.parse(
                  content!.contentUrl!,
                  // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                ),
              )
                ..setLooping(true)
                ..initialize().then((_) {
                  viewControllers[i]?.play();
                  setState(() {});
                });
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HYLL'),
        ),
        body: cubit.state.busy
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              )
            : InViewNotifierList(
                scrollDirection: Axis.vertical,
                initialInViewIds: const ['0'],
                isInViewPortCondition: (double deltaTop, double deltaBottom,
                    double viewPortDimension) {
                  return deltaTop < (0.5 * viewPortDimension) &&
                      deltaBottom > (0.5 * viewPortDimension);
                },
                itemCount: 10,
                builder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 300.0,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 50.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return InViewNotifierWidget(
                          id: '$index',
                          builder: (BuildContext context, bool isInView,
                              Widget? child) {
                            return VideoWidget(
                                play: isInView,
                                url:
                                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
                          },
                        );
                      },
                    ),
                  );
                },
              ),
        // : InViewNotifierList(
        //     isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) =>
        //         deltaTop < (0.5 * vpHeight) &&
        //         deltaBottom > (0.5 * vpHeight),
        //     itemCount: 10,
        //     builder: (context, index) {
        //       return InViewNotifierWidget(
        //         id: '$index',
        //         builder: (context, isInView, child) {
        //           return Container(
        //             height: 250.0,
        //             color: isInView ? Colors.green : Colors.red,
        //             child: Text(
        //               isInView ? 'Is in view' : 'Not in view',
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   ),
      ),
    );
  }

  // body: ListView(
  //   children: [
  //     _controller?.value.isInitialized ?? false
  //         ? AspectRatio(
  //             aspectRatio: _controller!.value.aspectRatio,
  //             child: VideoPlayer(_controller!),
  //           )
  //         : Container(),
  //     ...cubit.state.feed?.adventures
  //             ?.map(
  //               (adventure) => AdventureTile(adventure: adventure),
  //             )
  //             .toList() ??
  //         [],
  //     if (cubit.state.busy)
  //       const Center(
  //         child: Padding(
  //           padding: EdgeInsets.all(16.0),
  //           child: CircularProgressIndicator(),
  //         ),
  //       ),
  //   ],
  // ),

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    viewControllers.forEach((key, value) => value.dispose());
  }
}
