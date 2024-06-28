import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/tweeter/features/authentication/tweet_create_account.dart';
import 'package:tiktok_clone/tweeter/features/authentication/widgets/login_form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LoginPageTweet extends StatelessWidget {
  const LoginPageTweet({super.key});

  void _onCreateUserTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TweetCreateAccount(),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size28,
          color: Color(0xff4E98E9),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      "See what's happening in the world right now.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  const LoginFormButton(
                    assetPath: 'assets/images/google.svg',
                    text: "Continue with Google",
                  ),
                  Gaps.v20,
                  const LoginFormButton(
                    assetPath: 'assets/images/apple.svg',
                    text: "Continue with Apple",
                  ),
                  Gaps.v20,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Gaps.h16,
                      const Text(
                        "or",
                        style: TextStyle(
                          fontSize: Sizes.size10,
                        ),
                      ),
                      Gaps.h16,
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v20,
                  GestureDetector(
                    onTap: () => _onCreateUserTap(context),
                    child: const LoginFormButton(
                      text: "Create account",
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to our ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: ', ',
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Privacy Policy',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.blue,
                            ),
                        children: const [
                          TextSpan(
                            text: ', and ',
                          ),
                          TextSpan(
                            text: 'Cookie Use',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: 'Have an account already? ',
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: const [
                        TextSpan(
                          text: 'Log in                                  ',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
