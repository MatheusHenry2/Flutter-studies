import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AppWidget(title: "Olá mundo",));
}

class AppWidget extends StatelessWidget {

  final String title;

  const AppWidget({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          this.title,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.blue, fontSize: 40.0),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
