import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/tweeter/features/settings/view_models/darkmode_config_vm.dart';

class SettingsScreenTweet extends ConsumerWidget {
  const SettingsScreenTweet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Divider(),
          SwitchListTile.adaptive(
            value: ref.watch(darkModeConfigProvider).isDarkMode,
            onChanged: (value) =>
                ref.read(darkModeConfigProvider.notifier).setDark(value),
            secondary: ref.watch(darkModeConfigProvider).isDarkMode
                ? const Icon(FontAwesomeIcons.moon)
                : const Icon(FontAwesomeIcons.sun),
            title: ref.watch(darkModeConfigProvider).isDarkMode
                ? const Text('Dark Mode (ON)')
                : const Text('Dark Mode (OFF)'),
          ),
          SettingListTile(
            icon: Icons.person_add,
            text: "Follow and invite friends",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.notifications,
            text: "Notifications",
            ontap: () {},
          ),
          // SettingListTile(
          //   icon: Icons.lock,
          //   text: "Privacy",
          //   ontap: (context) => {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const PrivacyScreenTweet(),
          //       ),
          //     ),
          //   },
          // ),
          SettingListTile(
            icon: Icons.person,
            text: "Account",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.help,
            text: "Help",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.info,
            text: "About",
            ontap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            trailing: false
                // ignore: dead_code
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final dynamic ontap;

  const SettingListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(text),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      onTap: ontap,
    );
  }
}
