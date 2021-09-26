import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String urlImage;
  final bool hasVisualized;

  const ProfilePicture({
    Key? key,
    required this.urlImage,
    this.hasVisualized = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: ColorPalettle.FACEBOOK_BLUE,
      child: CircleAvatar(
        radius: hasVisualized ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
