import 'package:flutter/cupertino.dart';

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
