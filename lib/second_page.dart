import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  final String parameter;

  const SecondPage({super.key, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Parameter: $parameter'),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go to home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
