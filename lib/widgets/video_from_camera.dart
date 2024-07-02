import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class VideoFromCamera extends StatefulWidget {
  const VideoFromCamera({super.key, required this.onPickedVideo});
  final void Function(File videoFile) onPickedVideo;

  @override
  State<VideoFromCamera> createState() => _VideoFromCameraState();
}

class _VideoFromCameraState extends State<VideoFromCamera> {
  VideoPlayerController? _videoController;
  File? _selectedVideo;
  final ImagePicker picker = ImagePicker();

  // function of Record video from Camera
  void _takeVideoFromCamera() async {
    final pickedImage = await picker.pickVideo(
      source: ImageSource.camera,
    );
    if (pickedImage == null) {
      return;
    }
    setState(
      () {
        _selectedVideo = File(pickedImage.path);
      },
    );
    _videoController = VideoPlayerController.file(_selectedVideo!);
    _videoController!.initialize();
    _videoController!.play();
    widget.onPickedVideo(_selectedVideo!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        TextButton.icon(
          onPressed: () {
            _takeVideoFromCamera();
          },
          icon: const Icon(Icons.video_call),
          label: const Text("Record Video"),
        ),
      ],
    );
    if (_selectedVideo != null) {
      content = InkWell(
          onTap: () {
            _takeVideoFromCamera();
          },
          child: VideoPlayer(_videoController!));
    }
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white, width: 0.5, style: BorderStyle.none),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}
