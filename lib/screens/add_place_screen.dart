import 'package:flutter/material.dart';
import 'dart:io';
import 'package:black_coffer_2/widgets/video_from_camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:black_coffer_2/providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});
  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final TextEditingController _videoTitleController = TextEditingController();
  final TextEditingController _videoDescriptionController =
      TextEditingController();
  File? _selectedVideo;

  void _savePlace() {
    final enteredVideoTitle = _videoTitleController.text;
    final enteredVideoDescripton = _videoDescriptionController.text;
    if (enteredVideoTitle.isEmpty ||
        enteredVideoDescripton.isEmpty ||
        _selectedVideo == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(
          enteredVideoTitle,
          enteredVideoDescripton,
          _selectedVideo!,
        );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _videoTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Places"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Video Title"),
              controller: _videoTitleController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Video Description"),
              controller: _videoDescriptionController,
            ),
            const SizedBox(
              height: 10,
            ),
            VideoFromCamera(
              onPickedVideo: (videoFile) => _selectedVideo = videoFile,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _savePlace,
                  child: const Text("Add New Place"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
