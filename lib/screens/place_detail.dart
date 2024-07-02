import 'package:black_coffer_2/models/place.dart';
import 'package:black_coffer_2/widgets/videoPlayer.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.videoTitle),
        ),
        body: Stack(
          children: [VideoPlayerWidget(videoFile: place.videoFile)],
        ));
  }
}
