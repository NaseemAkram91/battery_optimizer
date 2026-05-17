import 'package:flutter/widgets.dart';

class GradientCard extends StatelessWidget {
  final List<Color> gColor;
  final Alignment begin;
  final Alignment end;
  final Widget child;

  const GradientCard({
    super.key,
    required this.child,
    required this.gColor,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(begin: begin, end: end, colors: gColor),
        border: Border.all(color: const Color(0xFF4103AC).withOpacity(0.5)),
      ),
      child: child,
    );
  }
}
