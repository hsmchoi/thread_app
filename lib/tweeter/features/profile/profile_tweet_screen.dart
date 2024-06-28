import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/profile/dummyscreen/tiktok_dummy_screen.dart';
import 'package:tiktok_clone/tweeter/features/profile/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/tweeter/features/profile/widgets/profile_button.dart';
import 'package:tiktok_clone/tweeter/features/settings/view_models/darkmode_config_vm.dart';
import 'package:tiktok_clone/tweeter/features/settings/views/settings_screen_tweet.dart';
import 'package:tiktok_clone/constants/github_avatar.dart';
import 'package:tiktok_clone/utils.dart';

class ProfileTweetScreen extends ConsumerStatefulWidget {
  const ProfileTweetScreen({super.key});

  @override
  ProfileTweetScreenState createState() => ProfileTweetScreenState();
}

class ProfileTweetScreenState extends ConsumerState<ProfileTweetScreen> {
  void _onBarPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreenTweet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/reshot-icon-globe-PL5973EKAD.svg",
                    width: 25,
                    colorFilter: ColorFilter.mode(
                      isDarkMode(ref) ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                      ),
                      const Gap(20),
                      IconButton(
                        onPressed: _onBarPressed,
                        icon: const FaIcon(
                          FontAwesomeIcons.bars,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "hsmchoi",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "hsmchoi_mobbin",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Gap(5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isDarkMode(ref)
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade100,
                                  ),
                                  child: const Text(
                                    "threads.net",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(githubAvatar),
                              radius: 35,
                            ),
                            Gap(10),
                          ],
                        ),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      "Plant enthusiast!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              CircleAvatar(
                                foregroundImage: NetworkImage(githubAvatar),
                                radius: 10,
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage("assets/images/red.jpg"),
                                  radius: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Text(
                          "300 followers",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileButton(
                            text: "Edit profile",
                          ),
                          ProfileButton(
                            text: "Share profile",
                          ),
                        ],
                      ),
                    ),
                    const Gap(5),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentTabBarTweet(
                isDark: ref.watch(darkModeConfigProvider).isDarkMode,
              ),
              pinned: true,
            ),
          ],
          body: const TabBarView(
            children: [
              TiktokDummyScreen(text: "text"),
              TiktokDummyScreen(text: "text"),
            ],
          ),
        ),
      ),
    );
  }
}
