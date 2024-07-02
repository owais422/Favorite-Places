import 'package:black_coffer_2/providers/user_places.dart';
import 'package:black_coffer_2/screens/add_place_screen.dart';
import 'package:black_coffer_2/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlace = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPlaceScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: PlacesList(places: userPlace),
    );
  }
}
