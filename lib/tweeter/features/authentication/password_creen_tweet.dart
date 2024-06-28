import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/tweeter/features/authentication/interests_screen_tweet.dart';
import 'package:tiktok_clone/tweeter/features/authentication/widgets/common_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/tiktok/textstyle/style_guide.dart';

class PasswordScreenTweet extends StatefulWidget {
  const PasswordScreenTweet({super.key});

  @override
  PasswordScreenTweetState createState() => PasswordScreenTweetState();
}

class PasswordScreenTweetState extends State<PasswordScreenTweet> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordValid = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _isPasswordValid = value.length >= 8;
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const InterestsScreenTweet(),
    ),);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: 28, // Sizes.size28 값이 없는 경우 직접 숫자 사용
          color: Color(0xff4E98E9),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              Text(
                "You'll need a password",
                style: StyleGuide.titleStyle(),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              Text(
                "Make sure it's 8 characters or more.",
                style: StyleGuide.explainStyle(),
                textAlign: TextAlign.start,
              ),
              Gaps.v20,
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                onChanged: _validatePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      if (_isPasswordValid)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CommonButton(
                validate: _isPasswordValid,
                textChange: false,
                colorChange: false,
                onPressed: _onNextTap,
              ),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
  }
}
