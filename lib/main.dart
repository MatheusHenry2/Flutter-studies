import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AppWidget(title: "Olá mundo"));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: GestureDetector(
          child: Text('Contador: $count'),
          onTap: () {
            setState(() {
              count++;
            });
            print('clicado');
          },
        ),
      ),
    );
  }
}
