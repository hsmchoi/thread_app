import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/tweeter/features/thread/screens/report_screen.dart';
import 'package:tiktok_clone/utils.dart';

class BottomButton extends ConsumerStatefulWidget {
  final String upperText, bottomText;

  const BottomButton({
    super.key,
    required this.upperText,
    required this.bottomText,
  });

  @override
  BottomButtonState createState() => BottomButtonState();
}

class BottomButtonState extends ConsumerState<BottomButton> {
  void _onReportTap() async {
    Navigator.of(context).pop();
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const ReportScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode(ref) ? Colors.grey.shade900 : Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Gap(20),
                Text(
                  widget.upperText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            widget.bottomText != "Report"
                ? Row(
                    children: [
                      const Gap(20),
                      Text(
                        widget.bottomText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: _onReportTap,
                    child: Row(
                      children: [
                        const Gap(20),
                        Text(
                          widget.bottomText,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
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
