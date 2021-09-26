import 'package:facebook_interface/components/circle_button.dart';
import 'package:facebook_interface/components/navigation_tabs.dart';
import 'package:facebook_interface/components/profile_image_button.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class desktopTabsNavigation extends StatelessWidget {
  final User user;
  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;

  const desktopTabsNavigation({
    Key? key,
    required this.user,
    required this.icons,
    required this.indexSelectedTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: ColorPalettle.FACEBOOK_BLUE,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: NavigationTabs(
              icons: icons,
              indexSelectedTab: indexSelectedTab,
              onTap: onTap,
              indicatorBelow: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileImageButton(
                  user: user,
                  onTap: () {},
                ),
                const SizedBox(
                  width: 4,
                ),
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
          ),
        ],
      ),
    );
  }
}
