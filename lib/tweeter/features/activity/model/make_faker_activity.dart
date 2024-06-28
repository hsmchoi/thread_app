import 'dart:math';

import 'package:faker/faker.dart';

final types = [
  "Replies",
  "Mentions",
  "Follows",
  "Likes",
];

List<Map<String, String>> generateActivityFakeData(int count, int seed) {
  var faker = Faker.withGenerator(RandomGenerator(seed: 227274)); // 고정된 시드 설정
  List<Map<String, String>> fakeDataList = [];

  String getImage() {
    final random = Random();
    return 'https://picsum.photos/300/200?hash=${random.nextInt(22727)}';
  }

  String getType() {
    final random = Random().nextInt(4);
    return types[random];
  }

  String getDataTime() {
    final random = Random().nextInt(12);
    return random.toString();
  }

  String subTitle(String type) {
    switch (type) {
      case "Replies":
        return "The purpose of our lives is to be happy";
      case "Mentions":
        return "Life is what happens when you're busy making other plans.";
      case "Follows":
        return "Followed you";
      case "Likes":
        return "Get busy living or get busy dying.";
      default:
        return "You only live once, but if you do it right, once is enough.";
    }
  }

  for (var i = 0; i < count; i++) {
    var randomType = getType();
    var fakeUser = {
      'subTitle': subTitle(randomType),
      'nickName': faker.internet.userName(),
      'avatar': getImage(),
      'type': randomType,
      'dataTime': getDataTime(),
    };

    fakeDataList.add(fakeUser);
  }

  return fakeDataList;
}
