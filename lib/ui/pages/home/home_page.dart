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
            const Text('Dias do ano'),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Inicio'),
                      Text(
                        '${controler.missingDaysEndYear()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controler.percentagePassedYear()}%'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fim'),
                      Text(
                        '${controler.beginningDaysStartYear()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controler.percentageTheEndYear()}%'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
