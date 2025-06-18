import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedIndex = -1;

  final List<String> _options = [
    'var myVariable: Int = 10',
    'val myVariable: Int = 10',
    'const myVariable: Int = 10',
    'let myVariable: Int = 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 29, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // close + título + espaço para centralizar
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    'assets/imagens/close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Quiz',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF120D1C),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),

            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Question 1/5',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontSize: 16,
                  color: Color(0xFF120D1C),
                ),
              ),
            ),

            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                value: 1 / 5,
                minHeight: 8,
                backgroundColor: Color(0xFFD6D1E8),
                valueColor: AlwaysStoppedAnimation(Color(0xFF6B30E8)),
              ),
            ),

            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What is the correct way to\n'
                'declare a variable in Kotlin?',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF120D1C),
                ),
              ),
            ),

            const SizedBox(height: 16),

            ...List.generate(_options.length, (i) {
              final isSelected = _selectedIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = i),
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: i == _options.length - 1 ? 0 : 16),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF6B30E8)
                          : const Color(0xFFD6D1E8),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF6B30E8)
                                : const Color(0xFF634D99),
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6B30E8),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _options[i],
                          style: const TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontSize: 14,
                            color: Color(0xFF120D1C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6B30E8),
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFFAF7FC),
            ),
          ),
        ),
      ),
    );
  }
}
