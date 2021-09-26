import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatelessWidget {
  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;
  final bool indicatorBelow;

  const NavigationTabs({
    Key? key,
    required this.icons,
    required this.indexSelectedTab,
    required this.onTap,
    this.indicatorBelow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: indicatorBelow
            ? const Border(
                bottom: BorderSide(
                  color: ColorPalettle.FACEBOOK_BLUE,
                  width: 3,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: ColorPalettle.FACEBOOK_BLUE,
                  width: 3,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((index, icon) {
            return MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: index == indexSelectedTab
                      ? ColorPalettle.FACEBOOK_BLUE
                      : Colors.black54,
                  size: 30,
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
