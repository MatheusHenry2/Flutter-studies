import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 29),
            const Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/imagens/profile.png'),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Kotlin Quizzes',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome back, Sarah',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF120D1C),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  // Item 1
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE8F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/imagens/code.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: const Text(
                      'Kotlin Basics',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                    subtitle: const Text(
                      '10 questions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 14,
                        color: Color(0xFF634D99),
                      ),
                    ),
                  ),

                  // Item 2
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE8F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/imagens/code.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: const Text(
                      'Data Types',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                    subtitle: const Text(
                      '15 questions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 14,
                        color: Color(0xFF634D99),
                      ),
                    ),
                  ),

                  // Item 3
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE8F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/imagens/code.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: const Text(
                      'Control Flow',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                    subtitle: const Text(
                      '12 questions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 14,
                        color: Color(0xFF634D99),
                      ),
                    ),
                  ),

                  // Item 4
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE8F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/imagens/code.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: const Text(
                      'Functions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                    subtitle: const Text(
                      '8 questions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 14,
                        color: Color(0xFF634D99),
                      ),
                    ),
                  ),
                  // Item 5
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE8F2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/imagens/code.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: const Text(
                      'Object-Oriented Programming',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                    subtitle: const Text(
                      '20 questions',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 14,
                        color: Color(0xFF634D99),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF634D99),
        unselectedItemColor: const Color(0xFF634D99),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school, size: 24), label: 'Learn'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24), label: 'Profile'),
        ],
      ),
    );
  }
}
