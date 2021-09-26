import 'package:facebook_interface/components/desktop_tabs_navigation.dart';
import 'package:facebook_interface/components/navigation_tabs.dart';
import 'package:facebook_interface/database/dados.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:facebook_interface/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<Widget> _screens = [
    Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.yellow),
    const Scaffold(backgroundColor: Colors.purple),
    const Scaffold(backgroundColor: Colors.black54),
    const Scaffold(backgroundColor: Colors.orange),
  ];

  int _indexSelectedTab = 0;

  // ignore: unused_field, prefer_final_fields
  List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                child: desktopTabsNavigation(
                  user: currentUser,
                  icons: _icons,
                  indexSelectedTab: _indexSelectedTab,
                  onTap: (index) {
                    setState(() {
                      _indexSelectedTab = index;
                    });
                  },
                ),
                preferredSize: Size(size.width, 65),
              )
            : null,
        body: TabBarView(
          children: _screens,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? NavigationTabs(
                icons: _icons,
                indexSelectedTab: _indexSelectedTab,
                onTap: (index) {
                  setState(() {
                    _indexSelectedTab = index;
                  });
                })
            : null,
      ),
    );
  }
}
