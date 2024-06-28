import 'package:flutter/material.dart';

class InterestButton extends StatelessWidget {
  final String interest;
  final Function(String) toggleInterest;
  final Set<String> selectedInterests;

  const InterestButton({
    required this.interest,
    required this.toggleInterest,
    required this.selectedInterests,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedInterests.contains(interest);
    return GestureDetector(
      onTap: () => toggleInterest(interest),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
          child: Text(
            interest,
          ),
        ),
      ),
    );
  }
}
