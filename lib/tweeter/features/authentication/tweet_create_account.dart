import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/authentication/term_page_tweet.dart';
import 'package:tiktok_clone/tweeter/features/authentication/widgets/confirm_button.dart';
import 'package:tiktok_clone/tweeter/models/user_data.dart';

class TweetCreateAccount extends StatefulWidget {
  const TweetCreateAccount({
    super.key,
  });

  @override
  State<TweetCreateAccount> createState() => _TweetCreateAccountState();
}

class _TweetCreateAccountState extends State<TweetCreateAccount> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String _username = "";
  String _phoneOrEmail = "";
  String _birthday = "";

  late final FocusNode _usernameFocusNode;
  late final FocusNode _phoneOrEmailFocusNode;
  late final FocusNode _birthdayFocusNode;

  DateTime initialDate = DateTime.now();
  bool _showsDatePicker = false;
  bool _isBirthdaySet = false;

  void _onTermsTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TermsPageScreen(
        userData: UserData(
          name: _usernameController.text,
          phoneOrEmail: _phoneOrEmailController.text,
          dateOfBirth: _birthdayController.text,
        ),
      ),
    ),);
  }

  void _onDateTextFieldFocusChanged(bool hasFocus) {
    setState(() {
      _showsDatePicker = hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
    _phoneOrEmailController.addListener(() {
      setState(() {
        _phoneOrEmail = _phoneOrEmailController.text;
      });
    });
    _birthdayController.addListener(() {
      setState(() {
        _birthday = _birthdayController.text;
      });
    });
    _usernameFocusNode = FocusNode();
    _phoneOrEmailFocusNode = FocusNode();
    _birthdayFocusNode = FocusNode()
      ..addListener(() {
        _onDateTextFieldFocusChanged(_birthdayFocusNode.hasFocus);
      });
  }

  void _setTextFieldDate(DateTime date) {
    if (!_isBirthdaySet) {
      setState(() {
        _isBirthdaySet = true;
      });
    }
    final textDate = "${date.year}-${date.month}-${date.day}";
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneOrEmailController.dispose();
    _birthdayController.dispose();
    _usernameFocusNode.dispose();
    _phoneOrEmailFocusNode.dispose();
    _birthdayFocusNode.dispose();
    super.dispose();
  }

  void _onNameTap() {
    _phoneOrEmailFocusNode.unfocus();
    _birthdayFocusNode.unfocus();
    FocusScope.of(context).requestFocus(_usernameFocusNode);
  }

  void _onEmailTap() {
    _usernameFocusNode.unfocus();
    _birthdayFocusNode.unfocus();
    FocusScope.of(context).requestFocus(_phoneOrEmailFocusNode);
  }

  void _onBirthdayTap() {
    _usernameFocusNode.unfocus();
    _phoneOrEmailFocusNode.unfocus();
    FocusScope.of(context).requestFocus(_birthdayFocusNode);
  }

  bool _isFieldValid(String value) {
    return value.isNotEmpty;
  }

  bool _isAllFieldValidate() {
    return _username.isNotEmpty &&
        _phoneOrEmail.isNotEmpty &&
        _birthday.isNotEmpty;
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create your account",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Heavy",
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap(20),
                TextField(
                  controller: _usernameController,
                  onTap: _onNameTap,
                  focusNode: _usernameFocusNode,
                  decoration:
                      _inputDecoration("Name", _isFieldValid(_username)),
                  cursorColor: Theme.of(context).primaryColor,
                  style: _txfieldStyle(context),
                ),
                const Gap(20),
                TextField(
                  controller: _phoneOrEmailController,
                  onTap: _onEmailTap,
                  focusNode: _phoneOrEmailFocusNode,
                  decoration: _inputDecoration("Phone number or email address",
                      _isFieldValid(_phoneOrEmail),),
                  cursorColor: Theme.of(context).primaryColor,
                  style: _txfieldStyle(context),
                ),
                const Gap(20),
                TextField(
                  controller: _birthdayController,
                  onTap: _onBirthdayTap,
                  focusNode: _birthdayFocusNode,
                  decoration: _inputDecoration(
                      "Date of birth", _isFieldValid(_birthday),),
                  cursorColor: Theme.of(context).primaryColor,
                  style: _txfieldStyle(context),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: _isAllFieldValidate()
                      ? () => _onTermsTap(context)
                      : () {},
                  child: ConfirmButton(
                    validate: _isAllFieldValidate(),
                    allValidate: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _showsDatePicker
          ? BottomAppBar(
              height: 300,
              child: SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                  maximumDate:
                      initialDate.subtract(const Duration(days: 12 * 365)),
                  initialDateTime:
                      initialDate.subtract(const Duration(days: 12 * 365)),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
              ),
            )
          : null,
    );
  }

  InputDecoration _inputDecoration(String labelText, bool isValid) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      suffixIcon: FaIcon(
        FontAwesomeIcons.circleCheck,
        color: isValid ? Colors.green : Colors.grey,
      ),
    );
  }
}

TextStyle _txfieldStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).primaryColor,
    fontFamily: "Helvetica Neue medium",
    fontWeight: FontWeight.w600,
  );
}
