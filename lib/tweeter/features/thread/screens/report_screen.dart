import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List listTiles = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "False information",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Scaffold(
        body: Column(
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
            const Center(
              child: Text(
                'Report',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(6),
            const Divider(),
            const Gap(6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Why are you reporting this thread?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Gap(4),
                  Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            const Gap(16),
            const Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: listTiles.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  listTiles;
                  return Stack(
                    children: [
                      ListTile(
                        title: Text(listTiles[index]),
                        onTap: () {},
                      ),
                      const Positioned(
                          right: 15,
                          bottom: 15,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),),
                    ],
                  );
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
