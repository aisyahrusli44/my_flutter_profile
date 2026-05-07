import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        fontFamily: 'SF Pro Text',
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ================= LINKS =================
  final String email = "mailto:aisyahruslee44@gmail.com";
  final String phone = "tel:+601165684644";
  final String instagram = "https://instagram.com/aisharusle3";

  // ================= OPEN LINK =================
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),  // Deep navy blue
              Color(0xFF1A1F3E),  // Slate blue
              Color(0xFF16213E),  // Dark blue
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // ================= PROFILE SECTION =================
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          // ================= CIRCLE AVATAR =================
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyan.withValues(alpha: 0.3),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                                width: 3,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 65,
                              backgroundImage: AssetImage("assets/images/profile2.png"),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Name
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Text(
                              "AISYAH RUSLI",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Courier',
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Student Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "🎓 SOFTWARE ENGINEERING STUDENT | UPSI",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // ================= PERSONAL INFO =================
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withValues(alpha: 0.05),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.person, size: 18, color: Color(0xFF4facfe)),
                                    SizedBox(width: 8),
                                    Text(
                                      "My Information",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _infoRow(Icons.cake, "Full Name", "Siti Aisyah Binti Rusli"),
                                _infoRow(Icons.cake, "Date of Birth", "16 March 2004"),
                                _infoRow(Icons.location_on, "State", "Kelantan, Malaysia"),
                                _infoRow(Icons.credit_card, "Student ID", "D20231106422"),
                                _infoRow(Icons.school, "Faculty", "Faculty of Computing & Meta Technology"),
                                _infoRow(Icons.today, "Semester", "Semester 6"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ================= QUOTE SLIDER =================
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white.withValues(alpha: 0.08),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      child: const _QuoteSlider(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ================= SKILLS SECTION =================
                _buildGlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.code, color: Color(0xFF4facfe), size: 24),
                          SizedBox(width: 8),
                          Text(
                            "Technical Skills",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _skillChip("Flutter", Icons.mobile_friendly),
                          _skillChip("Dart", Icons.code),
                          _skillChip("UI/UX Design", Icons.design_services),
                          _skillChip("Firebase", Icons.cloud_queue),
                          _skillChip("Figma", Icons.brush),
                          _skillChip("Git", Icons.merge_type),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ================= INTERESTS SECTION =================
                _buildGlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.favorite, color: Color(0xFF4facfe), size: 24),
                          SizedBox(width: 8),
                          Text(
                            "Interests",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _interestChip("🎨 UI Design"),
                          _interestChip("💻 Coding"),
                          _interestChip("🎧 Music"),
                          _interestChip("☕ Coffee"),
                          _interestChip("📸 Photography"),
                          _interestChip("✍️ Writing"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ================= CONTACT SECTION =================
                _buildGlassCard(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.contact_mail, color: Color(0xFF4facfe), size: 24),
                          SizedBox(width: 8),
                          Text(
                            "Connect With Me",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _socialButton(
                            icon: Icons.email,
                            label: "Email",
                            color: const Color(0xFF4facfe),
                            onTap: () => launchURL(email),
                          ),
                          _socialButton(
                            icon: Icons.phone,
                            label: "Call",
                            color: const Color(0xFF00f2fe),
                            onTap: () => launchURL(phone),
                          ),
                           _socialButton(
                            icon: Icons.camera_alt,
                            label: "Instagram",
                            color: const Color(0xFFE4405F),
                            onTap: () => launchURL(instagram),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Footer
                const Text(
                  "Created by Aisyah Rusli • Crafted with Flutter",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF4facfe)),
          const SizedBox(width: 12),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Modern glass card
  Widget _buildGlassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withValues(alpha: 0.08),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  // Modern skill chip
  Widget _skillChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withValues(alpha: 0.1),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF4facfe)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Interest chip
  Widget _interestChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4facfe).withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  // Modern social button
  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= MODERN QUOTE SLIDER =================
class _QuoteSlider extends StatefulWidget {
  const _QuoteSlider();

  @override
  State<_QuoteSlider> createState() => _QuoteSliderState();
}

class _QuoteSliderState extends State<_QuoteSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<QuoteItem> _quotes = [
    QuoteItem(
      quote: "Innovation distinguishes between a leader and a follower.",
      author: "Steve Jobs",
      icon: Icons.lightbulb_outline,
      gradient: [Color(0xFF667eea), Color(0xFF764ba2)],
    ),
    QuoteItem(
      quote: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      icon: Icons.auto_awesome,
      gradient: [Color(0xFFf093fb), Color(0xFFf5576c)],
    ),
    QuoteItem(
      quote: "Stay curious, keep learning, and never stop growing.",
      author: "Anonymous",
      icon: Icons.school_outlined,
      gradient: [Color(0xFF4facfe), Color(0xFF00f2fe)],
    ),
    QuoteItem(
      quote: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      icon: Icons.favorite_outline,
      gradient: [Color(0xFF43e97b), Color(0xFF38f9d7)],
    ),
    QuoteItem(
      quote: "Code is like humor. When you have to explain it, it's bad.",
      author: "Cory House",
      icon: Icons.code,
      gradient: [Color(0xFFfa709a), Color(0xFFfee140)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _quotes.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page! - index).abs();
                    value = (1 - (value * 0.2)).clamp(0.8, 1.0);
                  }
                  return Transform.scale(
                    scale: value,
                    child: _QuoteCard(
                      item: _quotes[index],
                      isActive: _currentPage == index,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _quotes.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: _currentPage == index
                    ? const LinearGradient(
                        colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                      )
                    : null,
                color: _currentPage == index ? null : Colors.white.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QuoteItem {
  final String quote;
  final String author;
  final IconData icon;
  final List<Color> gradient;

  QuoteItem({
    required this.quote,
    required this.author,
    required this.icon,
    required this.gradient,
  });
}

class _QuoteCard extends StatelessWidget {
  final QuoteItem item;
  final bool isActive;

  const _QuoteCard({
    required this.item,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: item.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: item.gradient.first.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withValues(alpha: 0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      child: Icon(
                        item.icon,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    if (isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        child: const Text(
                          "✨ Today's Inspiration",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: Text(
                      "”${item.quote}”",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "- ${item.author}",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}