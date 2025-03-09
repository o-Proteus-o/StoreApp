import 'package:fake_store/views/view/home.dart';
import 'package:fake_store/views/widgets/put/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FakeStore());
}

class FakeStore extends StatelessWidget {
  const FakeStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        UpdatePage.routeName: (context) => const UpdatePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
