
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Hello, ',
        style: AppStyles.styleRegular35(context).copyWith(color: Colors.grey.shade400),
        children: [TextSpan(text: 'User', style: AppStyles.styleSemiBold35(context))],
      ),
    );
  }
}
