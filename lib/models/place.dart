import 'dart:io';

enum VideoCategory { entertainment, education, travel }

class Place {
  const Place(
      {required this.videoTitle,
      required this.videoDescription,
      required this.videoFile
      //  required this.videoCategory,
      });
  final String videoTitle;
  final String videoDescription;
  final File videoFile;
  // final VideoCategory videoCategory;
}
