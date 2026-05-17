import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Domain entity for tool grid items.
class ToolItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  final List<Color> gradientColors;

  const ToolItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
    required this.gradientColors,
  });

  @override
  List<Object?> get props => [id, title, route];

  Color? get iconColor => null;
}
