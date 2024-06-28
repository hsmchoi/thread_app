import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/authentication/interests_second_screen.dart';

import 'package:tiktok_clone/tweeter/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/tiktok/textstyle/style_guide.dart';

class InterestsScreenTweet extends StatefulWidget {
  const InterestsScreenTweet({super.key});

  @override
  InterestsScreenTweetState createState() => InterestsScreenTweetState();
}

class InterestsScreenTweetState extends State<InterestsScreenTweet> {
  final List<String> interests = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
  ];
  final Set<String> selectedInterests = {};

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  void _onNextTap() {
    if (selectedInterests.length >= 3) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const InterestsSecondScreen(),
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: 28,
          color: Color(0xff4E98E9),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(20),
                  Text(
                    "What do you want to see on Twitter?",
                    style: StyleGuide.titleStyle(),
                    textAlign: TextAlign.start,
                  ),
                  const Gap(20),
                  Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                    style: StyleGuide.explainStyle(),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),
            const Gap(20),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 4 / 2,
                children: interests.map((interest) {
                  final isSelected = selectedInterests.contains(interest);
                  return GestureDetector(
                    onTap: () => _toggleInterest(interest),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey[400]!,
                          width: 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              interest,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "${selectedInterests.length} of 3 selected",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _onNextTap,
                  child: FormButton(
                    isLarge: false,
                    disabled: (selectedInterests.length < 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
