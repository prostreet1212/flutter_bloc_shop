import 'package:flutter/material.dart';
import 'package:flutter_bloc_shop/ui/my_home_bloc_page.dart';
import 'package:flutter_bloc_shop/ui/my_home_cubit_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework 13'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('Flutter bloc shop'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyHomeBlocPage();
                  }));
                }),
            ElevatedButton(
                child: const Text('Flutter cubit shop'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyHomeCubitPage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
