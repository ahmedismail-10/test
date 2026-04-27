import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Colors
  static const Color _bgColor = Color(0xFF1A1A2E);
  static const Color _cardColor = Color(0xFF222235);
  static const Color _accentGreen = Color(0xFFCDFF00);
  static const Color _accentPurple = Color(0xFF9B59B6);
  static const Color _accentBlue = Color(0xFF3498DB);
  static const Color _accentTeal = Color(0xFF1ABC9C);
  static const Color _accentOrange = Color(0xFFE67E22);
  static const Color _textPrimary = Colors.white;
  static const Color _textSecondary = Color(0xFF8888AA);
  static const Color _dividerColor = Color(0xFF2E2E45);

  String _selectedUnit = 'Metric';
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              const SizedBox(height: 28),
              _buildProfilePhoto(),
              const SizedBox(height: 32),
              _buildPersonalInfoSection(),
              const SizedBox(height: 20),
              _buildPreferencesSection(),
              const SizedBox(height: 20),
              _buildChangePasswordRow(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // ── App Bar ──────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.chevron_left, color: _accentGreen, size: 28),
        ),
        const Text(
          'Edit profile',
          style: TextStyle(
            color: _textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Save',
            style: TextStyle(
              color: _accentGreen,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // ── Profile Photo ────────────────────────────────────────────────────────
  Widget _buildProfilePhoto() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              // Avatar with green border
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _accentGreen, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 42,
                  backgroundColor: Color(0xFF2E2E45),
                  child: Icon(Icons.person, size: 50, color: _textSecondary),
                ),
              ),
              // Camera badge
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: _accentGreen,
                    shape: BoxShape.circle,
                    border: Border.all(color: _bgColor, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Change Photo button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.camera_alt, size: 16, color: _textSecondary),
                SizedBox(width: 6),
                Text(
                  'Change Photo',
                  style: TextStyle(color: _textPrimary, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Personal Info Section ────────────────────────────────────────────────
  Widget _buildPersonalInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.person_outline,
            iconColor: _accentPurple,
            label: 'Full Name',
            value: 'Kareem Shaltout',
            showEdit: true,
          ),
          _buildDivider(),
          _buildInfoRow(
            icon: Icons.mail_outline,
            iconColor: _accentBlue,
            label: 'Email',
            value: 'Kareem.Shaltout@email.com',
            showEdit: true,
          ),
          _buildDivider(),
          _buildInfoRow(
            icon: Icons.accessibility_new,
            iconColor: _accentTeal,
            label: 'Gender',
            value: 'Male',
            showArrow: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    bool showEdit = false,
    bool showArrow = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: _textSecondary, fontSize: 11),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: _textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (showEdit) const Icon(Icons.edit, color: _textSecondary, size: 18),
          if (showArrow)
            const Icon(Icons.chevron_right, color: _textSecondary, size: 22),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: _dividerColor,
      height: 1,
      indent: 52,
      endIndent: 0,
    );
  }

  // ── Preferences Section ──────────────────────────────────────────────────
  Widget _buildPreferencesSection() {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Units row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Icon(Icons.straighten, color: _accentOrange, size: 22),
                const SizedBox(width: 14),
                const Text(
                  'Units',
                  style: TextStyle(color: _textPrimary, fontSize: 15),
                ),
                const Spacer(),
                _buildToggleButton(
                  label: 'Metric (kg, cm)',
                  selected: _selectedUnit == 'Metric',
                  onTap: () => setState(() => _selectedUnit = 'Metric'),
                ),
                const SizedBox(width: 8),
                _buildToggleButton(
                  label: 'Imperial (lbs, ft)',
                  selected: _selectedUnit == 'Imperial',
                  onTap: () => setState(() => _selectedUnit = 'Imperial'),
                ),
              ],
            ),
          ),
          const Divider(color: _dividerColor, height: 1, indent: 52),
          // Language row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Icon(Icons.language, color: _accentPurple, size: 22),
                const SizedBox(width: 14),
                const Text(
                  'Language',
                  style: TextStyle(color: _textPrimary, fontSize: 15),
                ),
                const Spacer(),
                _buildToggleButton(
                  label: 'English',
                  selected: _selectedLanguage == 'English',
                  onTap: () => setState(() => _selectedLanguage = 'English'),
                ),
                const SizedBox(width: 8),
                _buildToggleButton(
                  label: 'Arabic',
                  selected: _selectedLanguage == 'Arabic',
                  onTap: () => setState(() => _selectedLanguage = 'Arabic'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? _accentGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? _accentGreen : _dividerColor,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : _textSecondary,
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // ── Change Password ──────────────────────────────────────────────────────
  Widget _buildChangePasswordRow() {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: const [
            Icon(Icons.lock_outline, color: _accentOrange, size: 22),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                'Change Password',
                style: TextStyle(
                  color: _textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: _textSecondary, size: 22),
          ],
        ),
      ),
    );
  }
}
