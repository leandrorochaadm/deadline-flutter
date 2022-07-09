import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/year');
                },
                child: Text('Ano'))
          ],
        ),
      ),
    );
  }
}
