import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyles.title)),
        Text(
          'View All',
          style: AppTextStyles.bodySmall.copyWith(
            color: Color(0xFFB77DFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
