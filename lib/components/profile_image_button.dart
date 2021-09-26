import 'package:facebook_interface/components/profile_picture.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:flutter/material.dart';

class ProfileImageButton extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const ProfileImageButton({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilePicture(
            urlImage: user.urlImage,
            hasVisualized: true,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
