import 'package:facebook_interface/models/user.dart';

class Story {
  User user;
  String urlImage;
  bool hasVisualized;

  Story({
    required this.user,
    required this.urlImage,
    this.hasVisualized = false,
  });
}
