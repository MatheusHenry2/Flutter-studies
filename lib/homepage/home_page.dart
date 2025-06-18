import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../quiz/quiz_page.dart';

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
                  _buildQuizTile(context, 'Kotlin Basics', '10 questions'),
                  _buildQuizTile(context, 'Data Types', '15 questions'),
                  _buildQuizTile(context, 'Control Flow', '12 questions'),
                  _buildQuizTile(context, 'Functions', '8 questions'),
                  _buildQuizTile(
                      context, 'Object-Oriented Programming', '20 questions'),
                ],
              ),
            ),
          ],
        ),
      ),
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

  Widget _buildQuizTile(BuildContext context, String title, String subtitle) {
    return ListTile(
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
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xFF120D1C),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontSize: 14,
          color: Color(0xFF634D99),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const QuizScreen()),
        );
      },
    );
  }
}
