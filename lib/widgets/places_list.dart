import 'package:black_coffer_2/screens/place_detail.dart';
import 'package:black_coffer_2/widgets/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:black_coffer_2/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text("No Places Added Yet"),
      );
    }
    ;
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            width: 60,
            height: 60,
            child: VideoPlayerWidget(
              videoFile: places[index].videoFile,
            ),
          ),
          title: Text(places[index].videoTitle),
          subtitle: Text(places[index].videoDescription),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(
                place: places[index],
              ),
            ));
          },
        );
      },
    );
  }
}
