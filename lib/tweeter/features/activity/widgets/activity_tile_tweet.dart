import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/activity/widgets/activity_icon.dart';
import 'package:tiktok_clone/constants/github_avatar.dart';
import 'package:tiktok_clone/utils.dart';

class ActivityTileTweet extends ConsumerWidget {
  final String nickName, subTitle, dataTime, avatar, type;

  const ActivityTileTweet({
    super.key,
    required this.nickName,
    required this.subTitle,
    required this.avatar,
    required this.type,
    required this.dataTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 10,
          isThreeLine: true,
          dense: true,
          leading: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 50,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: FadeInImage(
                  height: 10,
                  width: 10,
                  fit: BoxFit.cover,
                  placeholder: const NetworkImage(githubAvatar),
                  image: NetworkImage(avatar),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: ActivityIcon(type: type),
              ),
            ],
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                nickName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(5),
              Opacity(
                opacity: 0.8,
                child: Text(
                  "${dataTime}h",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          subtitle: Opacity(
            opacity: 0.8,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          trailing: type == "Follows"
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                    "Following",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: isDarkMode(ref)
                              ? Colors.grey.shade300
                              : Colors.grey.shade700,
                        ),
                  ),
                )
              : null,
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
