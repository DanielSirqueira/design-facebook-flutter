import 'package:facebook_interface/components/profile_image_button.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Contatos",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: users.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ProfileImageButton(
                  user: users[index],
                  onTap: () {},
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
