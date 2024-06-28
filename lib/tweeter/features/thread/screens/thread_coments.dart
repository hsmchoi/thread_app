import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/thread/widgets/bottom_button.dart';

class ThreadComments extends StatefulWidget {
  const ThreadComments({super.key});

  @override
  State<ThreadComments> createState() => _ThreadCommentsState();
}

class _ThreadCommentsState extends State<ThreadComments> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.37,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
          child: Column(
            children: [
              const Gap(10),
              Center(
                child: Container(
                  height: 4.0,
                  width: 40.0,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              const BottomButton(upperText: "Unfollow", bottomText: "Mute"),
              const Gap(30),
              const BottomButton(upperText: "Hide", bottomText: "Report"),
            ],
          ),
        ),
      ),
    );
  }
}
