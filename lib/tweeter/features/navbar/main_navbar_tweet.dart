import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/tweeter/features/activity/activity_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/navbar/screens/LogInScreen.dart';
import 'package:tiktok_clone/tweeter/features/navbar/screens/tiktok_home_screen.dart';
import 'package:tiktok_clone/tweeter/features/navbar/widgets/nav_tap.dart';
import 'package:tiktok_clone/tweeter/features/profile/profile_tweet_screen.dart';
import 'package:tiktok_clone/tweeter/features/search/search_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/write/write_screen.dart';

class MainNavbarTweetScreen extends StatefulWidget {
  const MainNavbarTweetScreen({super.key});

  @override
  State<MainNavbarTweetScreen> createState() => _MainNavbarTweetScreenState();
}

class _MainNavbarTweetScreenState extends State<MainNavbarTweetScreen> {
  int _selectedIndex = 0;
  bool isSelected = false;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const WriteScreen(),
    );

    setState(() {
      isSelected = !isSelected;
    });
  }

  final List screens = [
    "Home",
    "Search",
    "Post",
    "Favorite",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const TiktokHomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreenTweet(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreenTweet(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileTweetScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTap(
              icon: FontAwesomeIcons.magnifyingGlass,
              selectedIcon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _onWriteTap,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isSelected ? 0.4 : 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        isSelected
                            ? FontAwesomeIcons.solidPenToSquare
                            : FontAwesomeIcons.penToSquare,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            NavTap(
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTap(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
