import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:tiktok_clone/constants/github_avatar.dart';
import 'package:tiktok_clone/utils.dart';

class SearchListTile extends ConsumerWidget {
  final String nickName, name, numOfFollower;
  final String avatar;
  final String? followAvatar;

  const SearchListTile({
    super.key,
    required this.nickName,
    required this.name,
    required this.numOfFollower,
    required this.avatar,
    this.followAvatar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          isThreeLine: true,
          dense: true,
          leading: Container(
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const NetworkImage(githubAvatar),
              image: NetworkImage(avatar),
            ),
          ),
          title: Row(
            children: [
              Text(
                nickName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(5),
              SvgPicture.asset("./assets/images/Twitter_Verified_Badge.svg"),
            ],
          ),
          subtitle: Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isDarkMode(ref)
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
                width: 1,
              ),
            ),
            child: Text(
              "Follow",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isDarkMode(ref)
                        ? Colors.grey.shade300
                        : Colors.grey.shade700,
                  ),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (followAvatar != null && followAvatar!.isNotEmpty)
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: 20,
                          height: 20,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const NetworkImage(githubAvatar),
                            image: NetworkImage(followAvatar!),
                          ),
                        ),
                      Text(
                        " ${numOfFollower}K followers",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
