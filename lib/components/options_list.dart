import 'package:facebook_interface/components/profile_image_button.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OptionsList extends StatelessWidget {
  final User user;

  final List<List> _options = const [
    [LineIcons.userFriends, ColorPalettle.FACEBOOK_BLUE, 'Amigos'],
    [LineIcons.facebookMessenger, ColorPalettle.FACEBOOK_BLUE, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Página'],
    [LineIcons.users, ColorPalettle.FACEBOOK_BLUE, 'Grupos'],
    [Icons.storefront_outlined, ColorPalettle.FACEBOOK_BLUE, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],
  ];

  const OptionsList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 1 + _options.length,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ProfileImageButton(
                user: user,
                onTap: () {},
              ),
            );
          }

          List item = _options[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Option(
              icon: item[0],
              color: item[1],
              text: item[2],
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  const Option({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 35,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
