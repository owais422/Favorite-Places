import 'package:black_coffer_2/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String videoTitle, String videoDescription, File videoFile) {
    final newPlace = Place(
        videoTitle: videoTitle,
        videoDescription: videoDescription,
        videoFile: videoFile);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
