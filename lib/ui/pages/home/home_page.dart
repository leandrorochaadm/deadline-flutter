import 'package:deadline/ui/pages/home/home_controler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeControler controler;
  const HomePage({Key? key, required this.controler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DEAD LINE TIME',
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Dias do ano =>'),
                  Text('inicio: ${controler.missingDaysEndYear()}'),
                  Text('${controler.percentagePassedYear()}%'),
                  const Text('/'),
                  Text('fim: ${controler.beginningDaysStartYear()}'),
                  Text('${controler.percentageTheEndYear()}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
