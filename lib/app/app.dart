import 'package:flutter/material.dart';
import 'package:myapp/screen/arthmatic_screen.dart';

class App extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Arithmetic(),
    );
  }
}
