import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  static final List<ToolItem> _tools = [
    ToolItem(
      icon: Icons.cleaning_services,
      title: 'Junk Cleaner',
      subtitle: 'Remove unnecessary files and cache',
      iconColor: Color(0xFF8F4DFF),
    ),
    ToolItem(
      icon: Icons.speed,
      title: 'Phone Boost',
      subtitle: 'Boost RAM and improve performance',
      iconColor: Color(0xFF3B82F6),
    ),
    ToolItem(
      icon: Icons.battery_charging_full,
      title: 'Battery Saver',
      subtitle: 'Saver power and extend battery life',
      iconColor: Color(0xFF22C55E),
    ),
    ToolItem(
      icon: Icons.ac_unit,
      title: 'CPU Cooler',
      subtitle: 'Cool down CPU and reduce temperature',
      iconColor: Color(0xFF06B6D4),
    ),
    ToolItem(
      icon: Icons.shield,
      title: 'Security Scan',
      subtitle: 'Protect your device from threats',
      iconColor: Color(0xFF22C55E),
    ),
    ToolItem(
      icon: Icons.notifications_active,
      title: 'Notification Cleaner',
      subtitle: 'Clean unnecessary notification',
      iconColor: Color(0xFFEAB308),
    ),
    ToolItem(
      icon: Icons.apps,
      title: 'App Manager',
      subtitle: 'Manage installed apps easily',
      iconColor: Color(0xFF8F4DFF),
    ),
    ToolItem(
      icon: Icons.folder,
      title: 'File Manager',
      subtitle: 'Manage files and free up space',
      iconColor: Color(0xFFF97316),
    ),
    ToolItem(
      icon: Icons.pie_chart,
      title: 'Data Usage',
      subtitle: 'Monitor data usage in real-time',
      iconColor: Color(0xFF3B82F6),
    ),
  ];

  static final List<QuickWidgetItem> _quickWidgets = [
    QuickWidgetItem(
      icon: Icons.battery_full,
      label: 'Battery',
      value: 0.72,
      percentage: '72%',
      color: Color(0xFF22C55E),
    ),
    QuickWidgetItem(
      icon: Icons.flash_on,
      label: 'Optimize',
      value: 0.85,
      color: Color(0xFFEAB308),
    ),
    QuickWidgetItem(
      icon: Icons.delete_outline,
      label: 'Clean',
      value: 0.60,
      color: Color(0xFFFF3B5C),
    ),
    QuickWidgetItem(
      icon: Icons.rocket_launch,
      label: 'Boost',
      value: 0.68,
      percentage: '68%',
      color: Color(0xFF3B82F6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F2A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ToolsHeader(),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _tools.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  return ToolGridCard(tool: _tools[index]);
                },
              ),
              const SizedBox(height: 24),
              QuickWidgetsSection(widgets: _quickWidgets),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data model for a tool item
class ToolItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const ToolItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });
}

/// Data model for a quick widget item
class QuickWidgetItem {
  final IconData icon;
  final String label;
  final double value;
  final String? percentage;
  final Color color;

  const QuickWidgetItem({
    required this.icon,
    required this.label,
    required this.value,
    this.percentage,
    required this.color,
  });
}

/// Header with back button, title and premium badge
class _ToolsHeader extends StatelessWidget {
  const _ToolsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 100),
        const Text(
          'Tools',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEAB308)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.workspace_premium, color: Color(0xFFEAB308), size: 14),
              SizedBox(width: 4),
              Text(
                'Premium',
                style: TextStyle(
                  color: Color(0xFFEAB308),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Individual tool card in the grid
class ToolGridCard extends StatelessWidget {
  final ToolItem tool;
  final VoidCallback? onTap;

  const ToolGridCard({super.key, required this.tool, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1B235C), Color(0xff1B2153), Color(0xff13173A)],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xff4103AC)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tool.icon, color: tool.iconColor, size: 22),
            const SizedBox(height: 8),
            Text(
              tool.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              tool.subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xffD9D9D9),
                fontSize: 10,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xff9A3CFF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick Widgets bottom section
class QuickWidgetsSection extends StatelessWidget {
  final List<QuickWidgetItem> widgets;

  const QuickWidgetsSection({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff07082C), Color(0xff0C27A7)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Widgets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets.map((w) => QuickWidgetTile(item: w)).toList(),
          ),
        ],
      ),
    );
  }
}

/// Individual circular quick widget
class QuickWidgetTile extends StatelessWidget {
  final QuickWidgetItem item;

  const QuickWidgetTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: item.value,
                  strokeWidth: 4,
                  backgroundColor: Colors.white12,
                  valueColor: AlwaysStoppedAnimation(item.color),
                ),
              ),
              if (item.percentage != null)
                Text(
                  item.percentage!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                Icon(item.icon, color: item.color, size: 22),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
