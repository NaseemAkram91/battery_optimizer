import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const List<BatteryMetric> _batteryMetrics = [
    BatteryMetric(
      icon: Icons.battery_full,
      value: '12h 45m',
      label: 'Avg. Battery Life',
      color: Color(0xFFFF3B5C),
    ),
    BatteryMetric(
      icon: Icons.flash_on,
      value: '3',
      label: 'Charging Cycles',
      color: Color(0xFF3B82F6),
    ),
    BatteryMetric(
      icon: Icons.eco,
      value: '85%',
      label: 'Efficiency',
      color: Color(0xFF22C55E),
    ),
    BatteryMetric(
      icon: Icons.trending_up,
      value: '-18%',
      label: 'Battery Drain',
      color: Color(0xFF8F4DFF),
    ),
  ];

  static const List<SettingItem> _settings = [
    SettingItem(icon: Icons.person_outline, title: 'Personal Information'),
    SettingItem(icon: Icons.notifications_outlined, title: 'Notifications'),
    SettingItem(
      icon: Icons.palette_outlined,
      title: 'Theme',
      trailingText: 'Dark',
    ),
    SettingItem(
      icon: Icons.language_outlined,
      title: 'Language',
      trailingText: 'English',
    ),
    SettingItem(icon: Icons.cloud_outlined, title: 'Backup & Restore'),
    SettingItem(icon: Icons.headset_mic_outlined, title: 'Help & Support'),
    SettingItem(
      icon: Icons.info_outline,
      title: 'About Battery Optimizer',
      trailingText: 'v2.4.1',
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
              const _ProfileHeader(),
              const SizedBox(height: 24),
              const _ProfileInfoSection(),
              const SizedBox(height: 20),
              const BatterySummaryCard(metrics: _batteryMetrics),
              const SizedBox(height: 16),
              const _PremiumBanner(),
              const SizedBox(height: 16),
              AccountSettingsSection(settings: _settings),
              const SizedBox(height: 16),
              const _SignOutButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Data Models ----------------

class BatteryMetric {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const BatteryMetric({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });
}

class SettingItem {
  final IconData icon;
  final String title;
  final String? trailingText;

  const SettingItem({
    required this.icon,
    required this.title,
    this.trailingText,
  });
}

// ---------------- Header ----------------

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 20),
        const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white12),
          ),
          child: const Icon(
            Icons.settings_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

// ---------------- Profile Info Section ----------------

class _ProfileInfoSection extends StatelessWidget {
  const _ProfileInfoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Gradient ring avatar
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFFF3B5C), Color(0xFF8F4DFF), Color(0xFF3B82F6)],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1B2153),
              border: Border.all(color: const Color(0xFF0B0F2A), width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.white70, size: 40),
          ),
        ),
        const SizedBox(width: 14),
        // Name + premium + email + date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'M Ali',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(
                    Icons.workspace_premium,
                    color: Color(0xFFD946EF),
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Premium User',
                    style: TextStyle(
                      color: Color(0xFFD946EF),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'mali@gmail.com',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 2),
              Row(
                children: const [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white54,
                    size: 11,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Member since 20 May 2026',
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Profile Score card
        const _ProfileScoreCard(),
      ],
    );
  }
}

// ---------------- Profile Score Card ----------------

class _ProfileScoreCard extends StatelessWidget {
  const _ProfileScoreCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: const [
          Text(
            'Profile Score',
            style: TextStyle(color: Colors.white70, fontSize: 9),
          ),
          SizedBox(height: 4),
          Icon(Icons.shield, color: Color(0xFF8F4DFF), size: 20),
          SizedBox(height: 4),
          Text(
            '92/100',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Excellent',
            style: TextStyle(
              color: Color(0xFFD946EF),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Battery Summary Card ----------------

class BatterySummaryCard extends StatelessWidget {
  final List<BatteryMetric> metrics;

  const BatterySummaryCard({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Battery Summary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: metrics
                .map((m) => Expanded(child: _MetricTile(metric: m)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final BatteryMetric metric;

  const _MetricTile({required this.metric});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: metric.color.withOpacity(0.5)),
            color: metric.color.withOpacity(0.1),
          ),
          child: Icon(metric.icon, color: metric.color, size: 18),
        ),
        const SizedBox(height: 8),
        Text(
          metric.value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          metric.label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white60, fontSize: 10),
        ),
      ],
    );
  }
}

// ---------------- Premium Banner ----------------

class _PremiumBanner extends StatelessWidget {
  const _PremiumBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4C2A8A), Color(0xFF2A3B8F)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/Diamond.png"),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "You're Premium!",
                  style: TextStyle(
                    color: Color(0xFFD946EF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Enjoy all premium features\nand optimize your device',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white38),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Manage Plan',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Account & Settings ----------------

class AccountSettingsSection extends StatelessWidget {
  final List<SettingItem> settings;

  const AccountSettingsSection({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account & Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(settings.length, (index) {
            final isLast = index == settings.length - 1;
            return Column(
              children: [
                _SettingTile(item: settings[index]),
                if (!isLast) const Divider(color: Colors.white12, height: 1),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final SettingItem item;

  const _SettingTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(item.icon, color: Colors.white70, size: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            if (item.trailingText != null) ...[
              Text(
                item.trailingText!,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const SizedBox(width: 6),
            ],
            const Icon(Icons.chevron_right, color: Colors.white38, size: 18),
          ],
        ),
      ),
    );
  }
}

// ---------------- Sign Out Button ----------------

class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFFF3B5C).withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout, color: Color(0xFFFF3B5C), size: 18),
            SizedBox(width: 8),
            Text(
              'Sign Out',
              style: TextStyle(
                color: Color(0xFFFF3B5C),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
