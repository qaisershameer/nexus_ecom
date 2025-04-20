import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// heading
        Text(heading, style: headingTextStyles),
        /// gap
        const SizedBox(height: 8),
        /// subHeading
        Text(subHeading, style: subHeadingTextStyles),
      ],
    );
  }
}
