import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/tweeter/features/search/widgets/search_list_tile.dart';
import 'package:tiktok_clone/constants/make_faker.dart';

class SearchScreenTweet extends StatefulWidget {
  const SearchScreenTweet({super.key});

  @override
  State<SearchScreenTweet> createState() => _SearchScreenTweetState();
}

class _SearchScreenTweetState extends State<SearchScreenTweet> {
  final TextEditingController _textEditingController = TextEditingController();

  final fakerData = generateFakeData(20, 12345);
  late var finalUser = fakerData;
  void _onSearchChanged(String text) {
    setState(() {
      finalUser = fakerData
          .where((element) =>
              element["nickName"]
                  .toString()
                  .toLowerCase()
                  .contains(text.toLowerCase()) ||
              element["name"]
                  .toString()
                  .toLowerCase()
                  .contains(text.toLowerCase()),)
          .toList();
    });
  }

  bool isPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _textEditingController,
          placeholder: "Serch Anything",
          onChanged: _onSearchChanged,
          autocorrect: false,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView.separated(
        itemCount: finalUser.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 0,
          );
        },
        itemBuilder: (context, index) {
          return SearchListTile(
            nickName: finalUser[index]["nickName"].toString(),
            name: finalUser[index]["name"].toString(),
            numOfFollower:
                finalUser[index]["numOfFollower"].toString().substring(0, 4),
            avatar: finalUser[index]["avatar"].toString(),
            followAvatar: isPrime(index)
                ? finalUser[index]["followAvatar"].toString()
                : null,
          );
        },
      ),
    );
  }
}
