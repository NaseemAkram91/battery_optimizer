import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import '../../core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _icon(String icon, bool active) {
    return Image.asset(icon);
  }

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIndex: currentIndex,
      onTap: onTap,
      height: 60,
      circleWidth: 55,

      activeIcons: [
        _icon("assets/icons/active_home_icon.png", true),
        _icon("assets/icons/active_usage_icon.png", true),
        _icon("assets/icons/active_tool_icon.png", true),
        _icon("assets/icons/active_profile_icon.png", true),
      ],

      inactiveIcons: [
        _icon("assets/icons/inactive_home_icon.png", false),
        _icon("assets/icons/inactive_usage_icon.png", false),
        _icon("assets/icons/inactive_tool_icon.png", false),
        _icon("assets/icons/inactive_profile_icon.png", false),
      ],

      color: AppColors.bottomNavBg,
      circleColor: Color(0xff5B0DE0),
      // shadowColor: Colors.black12,
      elevation: 0,
    );
  }
}
