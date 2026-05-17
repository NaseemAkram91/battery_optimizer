import 'package:flutter/material.dart';

class CustomOutlineContainer extends StatelessWidget {
  final Color borderColor;
  final double pLeft;
  final double pRight;
  final double pTop;
  final double pBottom;
  final Widget child;
  const CustomOutlineContainer({
    super.key,
    required this.borderColor,
    this.pBottom = 6,
    this.pTop = 6,
    this.pLeft = 8,
    this.pRight = 8,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: pTop,
        bottom: pBottom,
        right: pRight,
        left: pLeft,
      ),
      decoration: BoxDecoration(
        color: Color(0xff181C3B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: child,
    );
  }
}
