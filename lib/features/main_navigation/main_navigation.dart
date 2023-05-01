import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/main_navigation/screens/stf_screen.dart';
import 'package:tictok/features/main_navigation/widgets/nav_tab.dart';
import 'package:tictok/features/main_navigation/widgets/pose_video_button.dart';
import 'package:tictok/features/videos/video_timeline_screen.dart';

class MainNavigation extends StatefulWidget {
  MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onPostVideoButton() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Record video'),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectIndex != 0,
          child: VideoTimeLineScreen(),
        ),
        Offstage(
          offstage: _selectIndex != 1,
          child: StfScreen(),
        ),
        Offstage(
          offstage: _selectIndex != 3,
          child: StfScreen(),
        ),
        Offstage(
          offstage: _selectIndex != 4,
          child: StfScreen(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  icon: FontAwesomeIcons.houseChimney,
                  selectedIcon: FontAwesomeIcons.houseChimneyUser,
                  text: "Home",
                  isSelected: _selectIndex == 0,
                  onTap: () => _onTap(0),
                ),
                NavTab(
                  text: "Discover",
                  isSelected: _selectIndex == 1,
                  icon: FontAwesomeIcons.magnifyingGlass,
                  selectedIcon: FontAwesomeIcons.magnifyingGlassArrowRight,
                  onTap: () => _onTap(1),
                ),
                GestureDetector(
                    onTap: _onPostVideoButton, child: PostVideoButton()),
                NavTab(
                  text: "Inbox",
                  isSelected: _selectIndex == 3,
                  icon: FontAwesomeIcons.message,
                  selectedIcon: FontAwesomeIcons.solidMessage,
                  onTap: () => _onTap(3),
                ),
                NavTab(
                  text: "Profile",
                  isSelected: _selectIndex == 4,
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  onTap: () => _onTap(4),
                )
              ]),
        ),
      ),
    );
  }
}
