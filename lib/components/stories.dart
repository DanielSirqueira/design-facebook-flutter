import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/profile_picture.dart';
import 'package:facebook_interface/database/dados.dart';
import 'package:facebook_interface/models/story.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:facebook_interface/utilities/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User usruario;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.usruario,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (_, index) {
          if (index == 0) {
            Story userStory = Story(
              user: currentUser,
              urlImage: currentUser.urlImage,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                story: userStory,
                addStory: true,
              ),
            );
          }

          Story story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final bool addStory;

  StoryCard({
    Key? key,
    required this.story,
    this.addStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: ColorPalettle.GRADIENT_STORY,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: ColorPalettle.FACEBOOK_BLUE,
                    onPressed: () {},
                  ),
                )
              : ProfilePicture(
                  urlImage: story.user.urlImage,
                  hasVisualized: story.hasVisualized,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStory ? "Criar Story" : story.user.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
