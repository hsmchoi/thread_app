import 'package:flutter/material.dart';

class TweetImageViewer extends StatelessWidget {
  final String assetPath;
  const TweetImageViewer({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.84,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            padding: const EdgeInsets.only(right: 20),
            color: Colors.grey,
            child: const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
