import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/tweeter/features/authentication/widgets/interest_button.dart';
import 'package:tiktok_clone/tiktok/textstyle/style_guide.dart';

const musics = [
  "Rap",
  "R&B soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Music industry",
  "Music news",
  "Hip hop",
  "Reggae",
  "Soul",
  "Country",
  "Funk",
  "Folk",
  "Middle Eastern",
  "Jazz",
  "Disco",
  "Classical",
  "Electronic",
  "New-age",
  "Christian",
  "Independent",
];

const entertainments = [
  "Anime",
  "Movies & TV",
  "Harry Potter",
  "Marvel Universe",
  "Movie news",
  "Movies",
  "Grammy Awards",
  "Science Fiction",
  "Fantasy",
  "Horror",
  "Comedy",
  "Drama",
  "Western",
  "Thriller",
  "Historical Fiction",
  "Action",
  "Adventure",
  "Crime",
  "Mistery",
  "Romance",
];

class InterestsSecondScreen extends StatefulWidget {
  const InterestsSecondScreen({super.key});

  @override
  State<InterestsSecondScreen> createState() => _InterestsSecondScreenState();
}

class _InterestsSecondScreenState extends State<InterestsSecondScreen> {
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
        builder: (context) => const FinishScreen(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "What do you want to see on Twitter?",
                    style: StyleGuide.titleStyle(),
                  ),
                  const Gap(28),
                  Text(
                    "Interests are used to personalize your experience and will be visible on your profile.",
                    style: StyleGuide.explainStyle(),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, thickness: 0.3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Music",
                    style: StyleGuide.subtitleStyle(),
                  ),
                  const Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 2,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var music in musics)
                            InterestButton(
                              interest: music,
                              toggleInterest: _toggleInterest,
                              selectedInterests: selectedInterests,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.3,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Entertainments",
                    style: StyleGuide.subtitleStyle(),
                  ),
                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 2,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var entertainment in entertainments)
                            InterestButton(
                              interest: entertainment,
                              toggleInterest: _toggleInterest,
                              selectedInterests: selectedInterests,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.3,
              height: 30,
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
                  onTap: selectedInterests.length >= 3 ? _onNextTap : null,
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

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Finished",
          style: StyleGuide.titleStyle(),
        ),
      ),
    );
  }
}
