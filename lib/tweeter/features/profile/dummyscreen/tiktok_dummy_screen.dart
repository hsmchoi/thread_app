import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/tweeter/features/navbar/widgets/post_basic_form.dart';

class TiktokDummyScreen extends StatefulWidget {
  final String text;
  const TiktokDummyScreen({super.key, required this.text});

  @override
  State<TiktokDummyScreen> createState() => _TiktokDummyScreenState();
}

class _TiktokDummyScreenState extends State<TiktokDummyScreen> {
  final faker2 = Faker.instance;
  Map<String, dynamic> _makeFakerData(int seed) {
    final faker = Faker.instance;

    String makeFakerimage(seed) {
      return faker.image.loremPicsum.image(
        width: 100,
        height: 100,
        seed: seed.toString(),
      );
    }

    final images = [
      makeFakerimage(seed),
      makeFakerimage(seed * 7),
      makeFakerimage(seed * 11),
      makeFakerimage(seed * 13),
      makeFakerimage(seed * 17),
      makeFakerimage(seed * 23),
    ];
    final post = faker.lorem.sentence();
    final user = faker.name.lastName();

    return {
      'userIcon': images[0],
      'postText': post,
      'postTime': "${seed}m",
      'userName': user,
      'postImages': [
        images[2],
        images[1],
      ],
      'repNum': seed * 3,
      'likeNum': seed * 7,
      'avator1': images[3],
      'avator2': images[4],
      'avator3': images[5],
    };
  }

  @override
  Widget build(BuildContext context) {
    final post1 = _makeFakerData(2);
    final post2 = _makeFakerData(7);
    final post3 = _makeFakerData(11);
    final post4 = _makeFakerData(14);
    final post5 = _makeFakerData(17);
    final post6 = _makeFakerData(19);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PostBasicForm(
              userIcon: post1['userIcon'],
              postText: "Just finished a great workout session!",
              postTime: post1['postTime'],
              userName: "john_doe",
              isImageUse: false,
              postImages: post1['postImages'],
              repNum: post1['repNum'],
              likeNum: post1['likeNum'],
              avator1: post1['avator1'],
              avator2: post1['avator2'],
              avator3: post1['avator3'],
            ),
            PostBasicForm(
              userIcon: post2['userIcon'],
              postText: "Loving the new features in the latest app update.",
              postTime: post2['postTime'],
              userName: "jane_smith",
              isImageUse: true,
              postImages: post2['postImages'],
              repNum: post2['repNum'],
              likeNum: post2['likeNum'],
              avator1: post2['avator1'],
              avator2: post2['avator2'],
              avator3: post2['avator3'],
            ),
            PostBasicForm(
              userIcon: post3['userIcon'],
              postText: "Had an amazing dinner at the new restaurant downtown.",
              postTime: post3['postTime'],
              userName: "alex_jones",
              isImageUse: false,
              postImages: post3['postImages'],
              repNum: post3['repNum'],
              likeNum: post3['likeNum'],
              avator1: post3['avator1'],
              avator2: post3['avator2'],
              avator3: post3['avator3'],
            ),
            PostBasicForm(
              userIcon: post4['userIcon'],
              postText: "Reading a fantastic book on personal development.",
              postTime: post4['postTime'],
              userName: "emily_clark",
              isImageUse: false,
              postImages: post4['postImages'],
              repNum: post4['repNum'],
              likeNum: post4['likeNum'],
              avator1: post4['avator1'],
              avator2: post4['avator2'],
              avator3: post4['avator3'],
            ),
            PostBasicForm(
              userIcon: post5['userIcon'],
              postText: "Exploring new hiking trails this weekend.",
              postTime: post5['postTime'],
              userName: "michael_brown",
              isImageUse: false,
              postImages: post5['postImages'],
              repNum: post5['repNum'],
              likeNum: post5['likeNum'],
              avator1: post5['avator1'],
              avator2: post5['avator2'],
              avator3: post5['avator3'],
            ),
            PostBasicForm(
              userIcon: post6['userIcon'],
              postText: "Enjoying a relaxing day at the beach.",
              postTime: post6['postTime'],
              userName: "sarah_davis",
              isImageUse: true,
              postImages: post6['postImages'],
              repNum: post6['repNum'],
              likeNum: post6['likeNum'],
              avator1: post6['avator1'],
              avator2: post6['avator2'],
              avator3: post6['avator3'],
            ),
          ],
        ),
      ),
    );
  }
}
