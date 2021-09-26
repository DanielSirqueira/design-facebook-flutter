import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/profile_picture.dart';
import 'package:facebook_interface/models/post.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:facebook_interface/utilities/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            //Cabeçalho
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(post: post),
                  const SizedBox(height: 5),
                  Text(
                    post.description,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(imageUrl: post.urlImage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: StatisticsPost(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilePicture(
          urlImage: post.user.urlImage,
          hasVisualized: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} - ',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class StatisticsPost extends StatelessWidget {
  final Post post;

  const StatisticsPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: ColorPalettle.FACEBOOK_BLUE,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.quantityLikes}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              '${post.quantityComments} comentários',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.quantityShare} Compartilhamentos',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(thickness: 1.2),
        Row(
          children: [
            PostButton(
              icon: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              text: 'Curtir',
              onTap: () {},
            ),
            PostButton(
              icon: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              text: 'Comentar',
              onTap: () {},
            ),
            PostButton(
              icon: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              text: 'Compartilhar',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const PostButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                icon,
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
