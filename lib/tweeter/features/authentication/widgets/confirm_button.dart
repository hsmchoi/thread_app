import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ConfirmButton extends StatelessWidget {
  final bool validate;
  final bool allValidate;

  const ConfirmButton({
    super.key,
    required this.allValidate,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          validate ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 300),
          width: validate ? 150 : 100,
          height: Sizes.size48,
          decoration: BoxDecoration(
            color: validate ? Theme.of(context).primaryColor : Colors.grey[500],
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Sizes.size40),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: Sizes.size16,
              fontFamily: "Helvetica Neue medium",
              fontWeight: FontWeight.w800,
              color: validate ? Colors.black : Colors.white,
            ),
            child: Text(
              allValidate ? "Sign up" : "Next",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontFamily: "Helvetica Neue medium",
                fontWeight: FontWeight.w800,
                color: validate ? Colors.white : Colors.grey[300],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
