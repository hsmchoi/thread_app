import 'dart:math';

import 'package:faker/faker.dart';

List<Map<String, String>> generateFakeData(int count, int seed) {
  var faker = Faker.withGenerator(RandomGenerator(seed: 227274));
  List<Map<String, String>> fakeDataList = [];

  String getImage() {
    final random = Random();
    return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
  }

  for (var i = 0; i < count; i++) {
    var fakeUser = {
      'name': faker.person.name(),
      'nickName': faker.internet.userName(),
      'avatar': getImage(),
      'followAvatar': getImage(),
      'numOfFollower':
          faker.currency.random.decimal(scale: 300, min: 10).toString(),
    };

    fakeDataList.add(fakeUser);
  }

  return fakeDataList;
}
