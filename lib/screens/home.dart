import 'package:facebook_interface/components/circle_button.dart';
import 'package:facebook_interface/components/contact_list.dart';
import 'package:facebook_interface/components/create_post_area.dart';
import 'package:facebook_interface/components/options_list.dart';
import 'package:facebook_interface/components/post_card.dart';
import 'package:facebook_interface/components/stories.dart';
import 'package:facebook_interface/database/dados.dart';
import 'package:facebook_interface/models/post.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:facebook_interface/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeMobile(scrollController: _scrollController),
          desktop: HomeDesktop(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: ColorPalettle.FACEBOOK_BLUE,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            CircularButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () {},
            ),
            CircularButton(
              icon: LineIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostArea(
            user: currentUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              usruario: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              Post post = posts[index];
              return PostCard(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: OptionsList(user: currentUser),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    usruario: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostArea(
                  user: currentUser,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    Post post = posts[index];
                    return PostCard(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ContactList(users: onlineUsers),
          ),
        ),
      ],
    );
  }
}
