import 'package:facebook_interface/models/user.dart';

class Post {
  User user;
  String description;
  String timeAgo;
  String urlImage;
  int quantityLikes;
  int quantityComments;
  int quantityShare;

  Post({
    required this.user,
    required this.description,
    required this.timeAgo,
    required this.urlImage,
    required this.quantityLikes,
    required this.quantityComments,
    required this.quantityShare,
  });
}
