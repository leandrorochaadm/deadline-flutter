import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CONTADOR DE DIAS',
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 16),
            const ButtonHomeWidget(label: 'ANO', route: '/year'),
            const SizedBox(height: 16),
            const ButtonHomeWidget(label: 'QUARTER', route: '/quarter'),
            const SizedBox(height: 16),
            const ButtonHomeWidget(label: 'VIDA', route: '/life'),
            const SizedBox(height: 16),
            const ButtonHomeWidget(label: 'Registro', route: '/register'),
          ],
        ),
      ),
    );
  }
}

class ButtonHomeWidget extends StatelessWidget {
  final String label;
  final String route;

  const ButtonHomeWidget({
    Key? key,
    required this.label,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(label),
      ),
    );
  }
}
